//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/actors/tasks/TaskActor.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorContext.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/messages/PoisonPill.h"
#include "im/actor/model/droidkit/actors/tasks/TaskActor.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskCancel.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskError.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskProgress.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskRequest.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskResult.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskStart.h"
#include "java/lang/Throwable.h"
#include "java/util/HashSet.h"

#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@interface ImActorModelDroidkitActorsTasksTaskActor () {
 @public
  JavaUtilHashSet *requests_;
  id result_;
  jboolean isCompleted__;
  jboolean isCompletedSuccess__;
  jlong dieTimeout_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor, requests_, JavaUtilHashSet *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor, result_, id)

@interface ImActorModelDroidkitActorsTasksTaskActor_Error () {
 @public
  JavaLangThrowable *error_;
}
- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)error;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor_Error, error_, JavaLangThrowable *)

@interface ImActorModelDroidkitActorsTasksTaskActor_Result () {
 @public
  id res_;
}
- (instancetype)initWithId:(id)res;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor_Result, res_, id)

@interface ImActorModelDroidkitActorsTasksTaskActor_Progress () {
 @public
  id progress_;
}
- (instancetype)initWithId:(id)progress;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor_Progress, progress_, id)

@interface ImActorModelDroidkitActorsTasksTaskActor_Obsolete ()
- (instancetype)init;
@end

@interface ImActorModelDroidkitActorsTasksTaskActor_TaskListener () {
 @public
  jint requestId_;
  DKActorRef *sender_;
}
- (instancetype)initWithInt:(jint)requestId
             withDKActorRef:(DKActorRef *)sender;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksTaskActor_TaskListener, sender_, DKActorRef *)

@implementation ImActorModelDroidkitActorsTasksTaskActor

- (void)setTimeOutWithLong:(jlong)timeOut {
  dieTimeout_ = timeOut;
}

- (jboolean)isCompleted {
  return isCompleted__;
}

- (jboolean)isCompletedSuccess {
  return isCompletedSuccess__;
}

- (void)preStart {
  [((DKActorRef *) nil_chk([self self__])) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskStart alloc] init]];
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskStart class]]) {
    [self startTask];
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksTaskActor_Obsolete class]]) {
    [self onTaskObsolete];
    [((DKActorContext *) nil_chk([self context])) stopSelf];
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskRequest class]]) {
    ImActorModelDroidkitActorsTasksMessagesTaskRequest *request = (ImActorModelDroidkitActorsTasksMessagesTaskRequest *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskRequest class]);
    if (isCompleted__) {
      if (isCompletedSuccess__) {
        [self replyWithId:result_];
      }
    }
    else {
      ImActorModelDroidkitActorsTasksTaskActor_TaskListener *listener = [[ImActorModelDroidkitActorsTasksTaskActor_TaskListener alloc] initWithInt:[((ImActorModelDroidkitActorsTasksMessagesTaskRequest *) nil_chk(request)) getRequestId] withDKActorRef:[self sender]];
      [((JavaUtilHashSet *) nil_chk(requests_)) addWithId:listener];
    }
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskCancel class]]) {
    ImActorModelDroidkitActorsTasksMessagesTaskCancel *cancel = (ImActorModelDroidkitActorsTasksMessagesTaskCancel *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskCancel class]);
    if (isCompleted__) {
      return;
    }
    ImActorModelDroidkitActorsTasksTaskActor_TaskListener *listener = [[ImActorModelDroidkitActorsTasksTaskActor_TaskListener alloc] initWithInt:[((ImActorModelDroidkitActorsTasksMessagesTaskCancel *) nil_chk(cancel)) getRequestId] withDKActorRef:[self sender]];
    [((JavaUtilHashSet *) nil_chk(requests_)) removeWithId:listener];
    if ([requests_ size] == 0) {
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:[[ImActorModelDroidkitActorsTasksTaskActor_Obsolete alloc] init] withLong:dieTimeout_];
    }
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksTaskActor_Progress class]]) {
    ImActorModelDroidkitActorsTasksTaskActor_Progress *progress = (ImActorModelDroidkitActorsTasksTaskActor_Progress *) check_class_cast(message, [ImActorModelDroidkitActorsTasksTaskActor_Progress class]);
    if (!isCompleted__) {
      for (ImActorModelDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DKActorRef *) nil_chk([((ImActorModelDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskProgress alloc] initWithInt:[request getRequestId] withId:((ImActorModelDroidkitActorsTasksTaskActor_Progress *) nil_chk(progress))->progress_]];
      }
    }
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksTaskActor_Result class]]) {
    if (!isCompleted__) {
      ImActorModelDroidkitActorsTasksTaskActor_Result *res = (ImActorModelDroidkitActorsTasksTaskActor_Result *) check_class_cast(message, [ImActorModelDroidkitActorsTasksTaskActor_Result class]);
      isCompleted__ = YES;
      isCompletedSuccess__ = YES;
      result_ = (id) [((ImActorModelDroidkitActorsTasksTaskActor_Result *) nil_chk(res)) getRes];
      for (ImActorModelDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DKActorRef *) nil_chk([((ImActorModelDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskResult alloc] initWithInt:[request getRequestId] withId:result_]];
      }
      [((DKActorRef *) nil_chk([self self__])) sendWithId:ImActorModelDroidkitActorsMessagesPoisonPill_get_INSTANCE_() withLong:dieTimeout_];
    }
  }
  else if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksTaskActor_Error class]]) {
    if (!isCompleted__) {
      isCompleted__ = YES;
      ImActorModelDroidkitActorsTasksTaskActor_Error *error = (ImActorModelDroidkitActorsTasksTaskActor_Error *) check_class_cast(message, [ImActorModelDroidkitActorsTasksTaskActor_Error class]);
      for (ImActorModelDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DKActorRef *) nil_chk([((ImActorModelDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskError alloc] initWithInt:[request getRequestId] withJavaLangThrowable:[((ImActorModelDroidkitActorsTasksTaskActor_Error *) nil_chk(error)) getError]]];
      }
      [((DKActorContext *) nil_chk([self context])) stopSelf];
    }
  }
}

- (void)postStop {
}

- (void)onTaskObsolete {
}

- (void)completeWithId:(id)res {
  [((DKActorRef *) nil_chk([self self__])) sendWithId:[[ImActorModelDroidkitActorsTasksTaskActor_Result alloc] initWithId:res]];
}

- (void)errorWithJavaLangThrowable:(JavaLangThrowable *)t {
  [((DKActorRef *) nil_chk([self self__])) sendWithId:[[ImActorModelDroidkitActorsTasksTaskActor_Error alloc] initWithJavaLangThrowable:t]];
}

- (void)progressWithId:(id)progress {
  [((DKActorRef *) nil_chk([self self__])) sendWithId:[[ImActorModelDroidkitActorsTasksTaskActor_Progress alloc] initWithId:progress]];
}

- (instancetype)init {
  if (self = [super init]) {
    requests_ = [[JavaUtilHashSet alloc] init];
    dieTimeout_ = 300;
  }
  return self;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksTaskActor *)other {
  [super copyAllFieldsTo:other];
  other->requests_ = requests_;
  other->result_ = result_;
  other->isCompleted__ = isCompleted__;
  other->isCompletedSuccess__ = isCompletedSuccess__;
  other->dieTimeout_ = dieTimeout_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor)

@implementation ImActorModelDroidkitActorsTasksTaskActor_Error

- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)error {
  if (self = [super init]) {
    self->error_ = error;
  }
  return self;
}

- (JavaLangThrowable *)getError {
  return error_;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksTaskActor_Error *)other {
  [super copyAllFieldsTo:other];
  other->error_ = error_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor_Error)

@implementation ImActorModelDroidkitActorsTasksTaskActor_Result

- (instancetype)initWithId:(id)res {
  if (self = [super init]) {
    self->res_ = res;
  }
  return self;
}

- (id)getRes {
  return res_;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksTaskActor_Result *)other {
  [super copyAllFieldsTo:other];
  other->res_ = res_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor_Result)

@implementation ImActorModelDroidkitActorsTasksTaskActor_Progress

- (instancetype)initWithId:(id)progress {
  if (self = [super init]) {
    self->progress_ = progress;
  }
  return self;
}

- (id)getProgress {
  return progress_;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksTaskActor_Progress *)other {
  [super copyAllFieldsTo:other];
  other->progress_ = progress_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor_Progress)

@implementation ImActorModelDroidkitActorsTasksTaskActor_Obsolete

- (instancetype)init {
  return [super init];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor_Obsolete)

@implementation ImActorModelDroidkitActorsTasksTaskActor_TaskListener

- (instancetype)initWithInt:(jint)requestId
             withDKActorRef:(DKActorRef *)sender {
  if (self = [super init]) {
    self->requestId_ = requestId;
    self->sender_ = sender;
  }
  return self;
}

- (jint)getRequestId {
  return requestId_;
}

- (DKActorRef *)getSender {
  return sender_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelDroidkitActorsTasksTaskActor_TaskListener *that = (ImActorModelDroidkitActorsTasksTaskActor_TaskListener *) check_class_cast(o, [ImActorModelDroidkitActorsTasksTaskActor_TaskListener class]);
  if (requestId_ != ((ImActorModelDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(that))->requestId_) return NO;
  if (![((DKActorRef *) nil_chk(sender_)) isEqual:that->sender_]) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = requestId_;
  result = 31 * result + ((jint) [((DKActorRef *) nil_chk(sender_)) hash]);
  return result;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksTaskActor_TaskListener *)other {
  [super copyAllFieldsTo:other];
  other->requestId_ = requestId_;
  other->sender_ = sender_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksTaskActor_TaskListener)