package im.actor.model.js.providers.websocket;

/**
 * Created by ex3ndr on 07.02.15.
 */
public interface WebSocketCallback {
    void onOpen();

    void onClose();

    void onMessage(byte[] message);
}