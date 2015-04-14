//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/tasks/ActorAskImpl.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/tasks/ActorAskImpl.java"

#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/messages/DeadLetter.h"
#include "im/actor/model/droidkit/actors/tasks/ActorAskImpl.h"
#include "im/actor/model/droidkit/actors/tasks/AskCallback.h"
#include "im/actor/model/droidkit/actors/tasks/AskFuture.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskCancel.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskError.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskProgress.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskRequest.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskResult.h"
#include "im/actor/model/droidkit/actors/tasks/messages/TaskTimeout.h"
#include "java/lang/Integer.h"
#include "java/lang/Throwable.h"
#include "java/util/Collection.h"
#include "java/util/HashMap.h"

__attribute__((unused)) static jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskResult *result);
__attribute__((unused)) static jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskProgress *progress);
__attribute__((unused)) static jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskError *error);
__attribute__((unused)) static jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskTimeout *taskTimeout);
__attribute__((unused)) static jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsMessagesDeadLetter *letter);

@interface ImActorModelDroidkitActorsTasksActorAskImpl () {
 @public
  JavaUtilHashMap *asks_;
  jint nextReqId_;
  DKActorRef *self__;
}

- (jboolean)onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult:(ImActorModelDroidkitActorsTasksMessagesTaskResult *)result;

- (jboolean)onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress:(ImActorModelDroidkitActorsTasksMessagesTaskProgress *)progress;

- (jboolean)onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError:(ImActorModelDroidkitActorsTasksMessagesTaskError *)error;

- (jboolean)onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout:(ImActorModelDroidkitActorsTasksMessagesTaskTimeout *)taskTimeout;

- (jboolean)onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter:(ImActorModelDroidkitActorsMessagesDeadLetter *)letter;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksActorAskImpl, asks_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksActorAskImpl, self__, DKActorRef *)

@interface ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer ()
- (instancetype)initWithImActorModelDroidkitActorsTasksActorAskImpl:(ImActorModelDroidkitActorsTasksActorAskImpl *)outer$
                       withImActorModelDroidkitActorsTasksAskFuture:(ImActorModelDroidkitActorsTasksAskFuture *)future
                                                     withDKActorRef:(DKActorRef *)ref
                                                            withInt:(jint)requestId;
@end

@interface ImActorModelDroidkitActorsTasksActorAskImpl_$1 () {
 @public
  ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *val$container_;
  jint val$index_;
  ImActorModelDroidkitActorsTasksAskFuture *val$resultFuture_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksActorAskImpl_$1, val$container_, ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsTasksActorAskImpl_$1, val$resultFuture_, ImActorModelDroidkitActorsTasksAskFuture *)


#line 15
@implementation ImActorModelDroidkitActorsTasksActorAskImpl


#line 21
- (instancetype)initWithDKActorRef:(DKActorRef *)self_ {
  if (self = [super init]) {
    asks_ =
#line 17
    [[JavaUtilHashMap alloc] init];
    nextReqId_ =
#line 18
    1;
    
#line 22
    self->self__ = self_;
  }
  return self;
}


#line 25
- (ImActorModelDroidkitActorsTasksAskFuture *)combineWithImActorModelDroidkitActorsTasksAskFutureArray:(IOSObjectArray *)futures {
  
#line 26
  ImActorModelDroidkitActorsTasksAskFuture *resultFuture = [[ImActorModelDroidkitActorsTasksAskFuture alloc] initWithImActorModelDroidkitActorsTasksActorAskImpl:self withInt:0];
  ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *container = [[ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer alloc] initWithImActorModelDroidkitActorsTasksActorAskImpl:self withInt:((IOSObjectArray *) nil_chk(futures))->size_];
  for (jint i = 0; i < futures->size_; i++) {
    jint index = i;
    IOSObjectArray_Set(nil_chk(container->futures_), index, IOSObjectArray_Get(futures, index));
    IOSObjectArray_SetAndConsume(nil_chk(container->callbacks_), index, [[ImActorModelDroidkitActorsTasksActorAskImpl_$1 alloc] initWithImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer:container withInt:index withImActorModelDroidkitActorsTasksAskFuture:resultFuture]);
    
#line 66
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(IOSObjectArray_Get(container->futures_, index))) addListenerWithImActorModelDroidkitActorsTasksAskCallback:IOSObjectArray_Get(container->callbacks_, index)];
  }
  return resultFuture;
}


#line 71
- (ImActorModelDroidkitActorsTasksAskFuture *)askWithDKActorRef:(DKActorRef *)ref
                                                       withLong:(jlong)timeout
                 withImActorModelDroidkitActorsTasksAskCallback:(id<ImActorModelDroidkitActorsTasksAskCallback>)callback {
  
#line 72
  jint reqId = nextReqId_++;
  ImActorModelDroidkitActorsTasksAskFuture *future = [[ImActorModelDroidkitActorsTasksAskFuture alloc] initWithImActorModelDroidkitActorsTasksActorAskImpl:self withInt:reqId];
  if (callback != nil) {
    [future addListenerWithImActorModelDroidkitActorsTasksAskCallback:callback];
  }
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [[ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer alloc] initWithImActorModelDroidkitActorsTasksActorAskImpl:self withImActorModelDroidkitActorsTasksAskFuture:future withDKActorRef:ref withInt:reqId];
  (void) [((JavaUtilHashMap *) nil_chk(asks_)) putWithId:JavaLangInteger_valueOfWithInt_(reqId) withId:container];
  [((DKActorRef *) nil_chk(ref)) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskRequest alloc] initWithInt:reqId] withDKActorRef:self__];
  if (timeout > 0) {
    [((DKActorRef *) nil_chk(self__)) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskTimeout alloc] initWithInt:reqId] withLong:timeout];
  }
  return future;
}


#line 88
- (void)preStart {
}


#line 93
- (jboolean)onReceiveWithId:(id)message {
  
#line 94
  if ([message isKindOfClass:[ImActorModelDroidkitActorsMessagesDeadLetter class]]) {
    if (ImActorModelDroidkitActorsTasksActorAskImpl_onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter_(self, (ImActorModelDroidkitActorsMessagesDeadLetter *) check_class_cast(message, [ImActorModelDroidkitActorsMessagesDeadLetter class]))) {
      return YES;
    }
  }
  else
#line 98
  if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskResult class]]) {
    if (ImActorModelDroidkitActorsTasksActorAskImpl_onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult_(self, (ImActorModelDroidkitActorsTasksMessagesTaskResult *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskResult class]))) {
      return YES;
    }
  }
  else
#line 102
  if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskTimeout class]]) {
    if (ImActorModelDroidkitActorsTasksActorAskImpl_onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout_(self, (ImActorModelDroidkitActorsTasksMessagesTaskTimeout *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskTimeout class]))) {
      return YES;
    }
  }
  else
#line 106
  if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskError class]]) {
    if (ImActorModelDroidkitActorsTasksActorAskImpl_onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError_(self, (ImActorModelDroidkitActorsTasksMessagesTaskError *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskError class]))) {
      return YES;
    }
  }
  else
#line 110
  if ([message isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskProgress class]]) {
    if (ImActorModelDroidkitActorsTasksActorAskImpl_onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress_(self, (ImActorModelDroidkitActorsTasksMessagesTaskProgress *) check_class_cast(message, [ImActorModelDroidkitActorsTasksMessagesTaskProgress class]))) {
      return YES;
    }
  }
  
#line 116
  return NO;
}


#line 120
- (void)postStop {
  {
    IOSObjectArray *a__ =
#line 121
    [((id<JavaUtilCollection>) nil_chk([((JavaUtilHashMap *) nil_chk(asks_)) values])) toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:0 type:ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer_class_()]];
    ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = *b__++;
      
#line 122
      [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(((ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *) nil_chk(container))->future_)) cancel];
    }
  }
}


#line 126
- (jboolean)onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult:(ImActorModelDroidkitActorsTasksMessagesTaskResult *)result {
  return ImActorModelDroidkitActorsTasksActorAskImpl_onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult_(self, result);
}


#line 137
- (jboolean)onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress:(ImActorModelDroidkitActorsTasksMessagesTaskProgress *)progress {
  return ImActorModelDroidkitActorsTasksActorAskImpl_onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress_(self, progress);
}


#line 148
- (jboolean)onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError:(ImActorModelDroidkitActorsTasksMessagesTaskError *)error {
  return ImActorModelDroidkitActorsTasksActorAskImpl_onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError_(self, error);
}


#line 159
- (jboolean)onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout:(ImActorModelDroidkitActorsTasksMessagesTaskTimeout *)taskTimeout {
  return ImActorModelDroidkitActorsTasksActorAskImpl_onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout_(self, taskTimeout);
}


#line 170
- (jboolean)onTaskCancelledWithInt:(jint)reqId {
  
#line 171
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(asks_)) removeWithId:JavaLangInteger_valueOfWithInt_(reqId)];
  if (container != nil) {
    
#line 174
    [((DKActorRef *) nil_chk(container->ref_)) sendWithId:[[ImActorModelDroidkitActorsTasksMessagesTaskCancel alloc] initWithInt:reqId] withDKActorRef:self__];
    return YES;
  }
  
#line 178
  return NO;
}


#line 181
- (jboolean)onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter:(ImActorModelDroidkitActorsMessagesDeadLetter *)letter {
  return ImActorModelDroidkitActorsTasksActorAskImpl_onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter_(self, letter);
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksActorAskImpl *)other {
  [super copyAllFieldsTo:other];
  other->asks_ = asks_;
  other->nextReqId_ = nextReqId_;
  other->self__ = self__;
}

@end

jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskResultWithImActorModelDroidkitActorsTasksMessagesTaskResult_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskResult *result) {
  
#line 127
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(self->asks_)) removeWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsTasksMessagesTaskResult *) nil_chk(result)) getRequestId])];
  if (container != nil) {
    
#line 130
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(container->future_)) onResultWithId:[result getRes]];
    return YES;
  }
  
#line 134
  return NO;
}

jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskProgressWithImActorModelDroidkitActorsTasksMessagesTaskProgress_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskProgress *progress) {
  
#line 138
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(self->asks_)) getWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsTasksMessagesTaskProgress *) nil_chk(progress)) getRequestId])];
  if (container != nil) {
    
#line 141
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(container->future_)) onProgressWithId:[progress getProgress]];
    return YES;
  }
  
#line 145
  return NO;
}

jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskErrorWithImActorModelDroidkitActorsTasksMessagesTaskError_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskError *error) {
  
#line 149
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(self->asks_)) removeWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsTasksMessagesTaskError *) nil_chk(error)) getRequestId])];
  if (container != nil) {
    
#line 152
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(container->future_)) onErrorWithJavaLangThrowable:[error getThrowable]];
    return YES;
  }
  
#line 156
  return NO;
}

jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onTaskTimeoutWithImActorModelDroidkitActorsTasksMessagesTaskTimeout_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsTasksMessagesTaskTimeout *taskTimeout) {
  
#line 160
  ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(self->asks_)) removeWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsTasksMessagesTaskTimeout *) nil_chk(taskTimeout)) getRequestId])];
  if (container != nil) {
    
#line 163
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(container->future_)) onTimeout];
    return YES;
  }
  
#line 167
  return NO;
}

jboolean ImActorModelDroidkitActorsTasksActorAskImpl_onDeadLetterWithImActorModelDroidkitActorsMessagesDeadLetter_(ImActorModelDroidkitActorsTasksActorAskImpl *self, ImActorModelDroidkitActorsMessagesDeadLetter *letter) {
  
#line 182
  if ([[((ImActorModelDroidkitActorsMessagesDeadLetter *) nil_chk(letter)) getMessage] isKindOfClass:[ImActorModelDroidkitActorsTasksMessagesTaskRequest class]]) {
    ImActorModelDroidkitActorsTasksMessagesTaskRequest *request = (ImActorModelDroidkitActorsTasksMessagesTaskRequest *) check_class_cast([letter getMessage], [ImActorModelDroidkitActorsTasksMessagesTaskRequest class]);
    ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *container = [((JavaUtilHashMap *) nil_chk(self->asks_)) getWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsTasksMessagesTaskRequest *) nil_chk(request)) getRequestId])];
    if (container != nil) {
      [((DKActorRef *) nil_chk(container->ref_)) sendWithId:request withDKActorRef:self->self__];
      return YES;
    }
  }
  
#line 194
  return NO;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksActorAskImpl)


#line 197
@implementation ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer


#line 202
- (instancetype)initWithImActorModelDroidkitActorsTasksActorAskImpl:(ImActorModelDroidkitActorsTasksActorAskImpl *)outer$
                       withImActorModelDroidkitActorsTasksAskFuture:(ImActorModelDroidkitActorsTasksAskFuture *)future
                                                     withDKActorRef:(DKActorRef *)ref
                                                            withInt:(jint)requestId {
  if (self = [super init]) {
    
#line 203
    self->future_ = future;
    
#line 204
    self->ref_ = ref;
    
#line 205
    self->requestId_ = requestId;
  }
  return self;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer *)other {
  [super copyAllFieldsTo:other];
  other->future_ = future_;
  other->ref_ = ref_;
  other->requestId_ = requestId_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksActorAskImpl_AskContainer)


#line 209
@implementation ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer


#line 216
- (instancetype)initWithImActorModelDroidkitActorsTasksActorAskImpl:(ImActorModelDroidkitActorsTasksActorAskImpl *)outer$
                                                            withInt:(jint)count {
  if (self = [super init]) {
    isCompleted_ = NO;
    
#line 217
    results_ = [IOSObjectArray newArrayWithLength:count type:NSObject_class_()];
    
#line 218
    completed_ = [IOSBooleanArray newArrayWithLength:count];
    
#line 219
    callbacks_ = [IOSObjectArray newArrayWithLength:count type:ImActorModelDroidkitActorsTasksAskCallback_class_()];
    
#line 220
    futures_ = [IOSObjectArray newArrayWithLength:count type:ImActorModelDroidkitActorsTasksAskFuture_class_()];
  }
  return self;
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *)other {
  [super copyAllFieldsTo:other];
  other->isCompleted_ = isCompleted_;
  other->results_ = results_;
  other->completed_ = completed_;
  other->futures_ = futures_;
  other->callbacks_ = callbacks_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer)

@implementation ImActorModelDroidkitActorsTasksActorAskImpl_$1


#line 33
- (void)onResultWithId:(id)result {
  
#line 34
  *IOSBooleanArray_GetRef(nil_chk(((ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *) nil_chk(val$container_))->completed_), val$index_) = YES;
  IOSObjectArray_Set(nil_chk(val$container_->results_), val$index_, result);
  jboolean isCompleted = YES;
  {
    IOSBooleanArray *a__ =
#line 37
    val$container_->completed_;
    jboolean const *b__ = a__->buffer_;
    jboolean const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      jboolean c = *b__++;
      
#line 38
      if (!c) {
        isCompleted = NO;
        break;
      }
    }
  }
  if (isCompleted && !val$container_->isCompleted_) {
    val$container_->isCompleted_ = YES;
    for (jint i = 0; i < ((IOSObjectArray *) nil_chk(val$container_->futures_))->size_; i++) {
      [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(IOSObjectArray_Get(val$container_->futures_, i))) removeListenerWithImActorModelDroidkitActorsTasksAskCallback:IOSObjectArray_Get(nil_chk(val$container_->callbacks_), i)];
    }
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(val$resultFuture_)) onResultWithId:val$container_->results_];
  }
}


#line 54
- (void)onErrorWithJavaLangThrowable:(JavaLangThrowable *)throwable {
  
#line 55
  if (!((ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *) nil_chk(val$container_))->isCompleted_) {
    val$container_->isCompleted_ = YES;
    for (jint i = 0; i < ((IOSObjectArray *) nil_chk(val$container_->futures_))->size_; i++) {
      [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(IOSObjectArray_Get(val$container_->futures_, i))) removeListenerWithImActorModelDroidkitActorsTasksAskCallback:IOSObjectArray_Get(nil_chk(val$container_->callbacks_), i)];
      [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(IOSObjectArray_Get(val$container_->futures_, i))) cancel];
    }
    [((ImActorModelDroidkitActorsTasksAskFuture *) nil_chk(val$resultFuture_)) onErrorWithJavaLangThrowable:throwable];
  }
}

- (instancetype)initWithImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer:(ImActorModelDroidkitActorsTasksActorAskImpl_CombineContainer *)capture$0
                                                                             withInt:(jint)capture$1
                                        withImActorModelDroidkitActorsTasksAskFuture:(ImActorModelDroidkitActorsTasksAskFuture *)capture$2 {
  val$container_ = capture$0;
  val$index_ = capture$1;
  val$resultFuture_ = capture$2;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsTasksActorAskImpl_$1 *)other {
  [super copyAllFieldsTo:other];
  other->val$container_ = val$container_;
  other->val$index_ = val$index_;
  other->val$resultFuture_ = val$resultFuture_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsTasksActorAskImpl_$1)