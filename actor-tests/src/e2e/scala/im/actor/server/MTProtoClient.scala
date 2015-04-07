package im.actor.server

import java.net.InetSocketAddress

import scala.concurrent.Await
import scala.concurrent.duration._
import scala.util.Random

import akka.actor._
import akka.io.{ IO, Tcp }
import akka.pattern.{ ask, gracefulStop }
import akka.util.{ ByteString, Timeout }
import scodec.bits.BitVector
import scodec.{ Attempt, DecodeResult, codecs => C }

import im.actor.server.mtproto.codecs.transport.{ HandshakeCodec, TransportPackageCodec }
import im.actor.server.mtproto.transport._

object MTProtoClient {
  def apply()(implicit system: ActorSystem) = new MTProtoClient(system)
}

class MTProtoClient(system: ActorSystem) {

  import MTProtoClientActor._

  private val clientActor = system.actorOf(MTProtoClientActor.props)

  def connectAndHandshake(remote: InetSocketAddress)(implicit timeout: Timeout = Timeout(5.seconds)) = {
    val res = Await.result(clientActor.ask(MTConnect(remote)), timeout.duration)

    if (res != MTConnected) {
      throw new Exception("Can not connect")
    }
  }

  def close()(implicit timeout: Timeout = Timeout(5.seconds)) = {
    val stopped = Await.result(gracefulStop(clientActor, timeout.duration), timeout.duration)

    if (!stopped) {
      throw new Exception("Closing timed out")
    }
  }

  def send(tp: MTTransport): Unit = {
    clientActor ! Send(tp)
  }

  def receiveTransportPackage()(implicit timeout: Timeout = Timeout(5.seconds)): Option[TransportPackage] = {
    Await.result(clientActor.ask(GetTransportPackage)(timeout).mapTo[Option[TransportPackage]], timeout.duration)
  }
}

object MTProtoClientActor {
  private val transportPackageList = C.list(TransportPackageCodec)

  case class MTConnect(remote: InetSocketAddress)

  case object MTConnected

  case class Send(p: MTTransport)

  case object GetTransportPackage

  val props = Props(classOf[MTProtoClientActor])
}

class MTProtoClientActor extends Actor with ActorLogging {

  import Tcp._

  import MTProtoClientActor._

  import context.system

  def receive: Receive = {
    case MTConnect(remote) =>
      val caller = sender()

      IO(Tcp) ! Connect(remote)
      context.become(connecting(caller), discardOld = true)
  }

  def connecting(caller: ActorRef): Receive = {
    case Connected(_, _) =>
      val connection = sender()
      connection ! Register(self)

      sendHandshake(connection)
      context.become(handshaking(caller, connection, BitVector.empty))
  }

  def handshaking(caller: ActorRef, connection: ActorRef, buffer: BitVector): Receive = {
    case Received(bs) =>
      val newBuffer = buffer ++ BitVector(bs.asByteBuffer)

      HandshakeCodec.decode(newBuffer) match {
        case Attempt.Successful(DecodeResult(hs, remainder)) =>
          caller ! MTConnected
          context.become(receiving(connection, remainder, Seq.empty), discardOld = true)
        case Attempt.Failure(_) =>
          context.become(handshaking(caller, connection, newBuffer), discardOld = true)
      }
    case CommandFailed(cmd) =>
      log.error("Command failed while handshaking {}", cmd)
  }

  def receiving(connection: ActorRef, buffer: BitVector, tps: Seq[TransportPackage]): Receive = {
    case Send(p: MTTransport) =>
      send(connection, p)
    case GetTransportPackage =>
      val tpOpt = tps.headOption
      sender() ! tpOpt

      if (tpOpt.isDefined) {
        context.become(receiving(connection, buffer, tps.tail), discardOld = true)
      }
    case Received(bs) =>
      val newBuffer = buffer ++ BitVector(bs.asByteBuffer)

      transportPackageList.decode(newBuffer).recover {
        case _ => DecodeResult(Seq.empty, newBuffer)
      } match {
        case Attempt.Successful(DecodeResult(newTps, remainder)) =>
          context.become(receiving(connection, remainder, tps ++ newTps), discardOld = true)
        case Attempt.Failure(e) => // should never happen
          log.error("Failed to decode TransportPackage: {}", e)
          throw new Exception("Failed to decode TransportPackage")
      }
    case CommandFailed(w: Write) =>
      log.error("Failed to write {}", w.data)
  }

  private def sendHandshake(connection: ActorRef): Unit = {
    val protoVersion = 1.toByte
    val apiMajorVersion = 1.toByte
    val apiMinorVersion = 1.toByte
    val randomBytes = Random.nextString(10).getBytes

    // TODO: check digest
    //val randomBytesDigest = DigestUtils.sha1(Array(protoVersion, apiMajorVersion, apiMinorVersion) ++ randomBytes)
    val handshake = Handshake(protoVersion, apiMajorVersion, apiMinorVersion, BitVector(randomBytes))
    send(connection, handshake)
  }

  private def send(connection: ActorRef, mtp: MTTransport): Unit = {
    val bits = mtp match {
      case h: Handshake =>
        HandshakeCodec.encode(h).require
      case ProtoPackage(tp) =>
        TransportPackageCodec.encode(TransportPackage(1, tp)).require
      case SilentClose =>
        log.error("Tried to send SilentClose, ignoring")
        BitVector.empty
    }

    val data = ByteString(bits.toByteBuffer)

    log.debug("Writing {}", data)
    connection ! Write(data)
  }
}