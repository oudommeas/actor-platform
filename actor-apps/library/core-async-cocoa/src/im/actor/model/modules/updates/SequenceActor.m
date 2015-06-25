//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/library/core/src/main/java/im/actor/model/modules/updates/SequenceActor.java
//


#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/DifferenceUpdate.h"
#include "im/actor/model/api/base/FatSeqUpdate.h"
#include "im/actor/model/api/base/SeqUpdate.h"
#include "im/actor/model/api/base/SeqUpdateTooLong.h"
#include "im/actor/model/api/base/WeakUpdate.h"
#include "im/actor/model/api/parser/UpdatesParser.h"
#include "im/actor/model/api/rpc/RequestGetDifference.h"
#include "im/actor/model/api/rpc/RequestGetState.h"
#include "im/actor/model/api/rpc/ResponseGetDifference.h"
#include "im/actor/model/api/rpc/ResponseSeq.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/Environment.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/updates/SequenceActor.h"
#include "im/actor/model/modules/updates/UpdateProcessor.h"
#include "im/actor/model/modules/updates/internal/ExecuteAfter.h"
#include "im/actor/model/modules/updates/internal/InternalUpdate.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/network/parser/Update.h"
#include "java/io/IOException.h"
#include "java/lang/Integer.h"
#include "java/lang/Runnable.h"
#include "java/util/ArrayList.h"
#include "java/util/HashMap.h"
#include "java/util/List.h"

#define ImActorModelModulesUpdatesSequenceActor_INVALIDATE_GAP 2000
#define ImActorModelModulesUpdatesSequenceActor_INVALIDATE_MAX_SEC_HOLE 10

@interface ImActorModelModulesUpdatesSequenceActor () {
 @public
  JavaUtilHashMap *further_;
  JavaUtilArrayList *pendingRunnables_;
  jboolean isValidated_;
  jboolean isTimerStarted_;
  jint seq_;
  IOSByteArray *state_;
  ImActorModelModulesUpdatesUpdateProcessor *processor_;
  ImActorModelApiParserUpdatesParser *parser_;
}

- (void)onUpdateReceivedWithId:(id)u;

- (jboolean)isValidSeqWithInt:(jint)seq;

- (void)invalidate;

- (void)checkFuture;

- (void)checkRunnables;

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor, further_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor, pendingRunnables_, JavaUtilArrayList *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor, state_, IOSByteArray *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor, processor_, ImActorModelModulesUpdatesUpdateProcessor *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor, parser_, ImActorModelApiParserUpdatesParser *)

static NSString *ImActorModelModulesUpdatesSequenceActor_TAG_ = @"Updates";
J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesUpdatesSequenceActor, TAG_, NSString *)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesUpdatesSequenceActor, INVALIDATE_GAP, jint)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesUpdatesSequenceActor, INVALIDATE_MAX_SEC_HOLE, jint)

static NSString *ImActorModelModulesUpdatesSequenceActor_KEY_SEQ_ = @"updates_seq";
J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesUpdatesSequenceActor, KEY_SEQ_, NSString *)

static NSString *ImActorModelModulesUpdatesSequenceActor_KEY_STATE_ = @"updates_state";
J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesUpdatesSequenceActor, KEY_STATE_, NSString *)

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(ImActorModelModulesUpdatesSequenceActor *self, id u);

__attribute__((unused)) static jboolean ImActorModelModulesUpdatesSequenceActor_isValidSeqWithInt_(ImActorModelModulesUpdatesSequenceActor *self, jint seq);

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_invalidate(ImActorModelModulesUpdatesSequenceActor *self);

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_checkFuture(ImActorModelModulesUpdatesSequenceActor *self);

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_checkRunnables(ImActorModelModulesUpdatesSequenceActor *self);

@interface ImActorModelModulesUpdatesSequenceActor_PushSeq () {
 @public
  jint seq_;
}

@end

@interface ImActorModelModulesUpdatesSequenceActor_$1 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesUpdatesSequenceActor *this$0_;
}

- (void)onResult:(APResponseSeq *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesUpdatesSequenceActor:(ImActorModelModulesUpdatesSequenceActor *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUpdatesSequenceActor_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor_$1, this$0_, ImActorModelModulesUpdatesSequenceActor *)

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(ImActorModelModulesUpdatesSequenceActor_$1 *self, ImActorModelModulesUpdatesSequenceActor *outer$);

__attribute__((unused)) static ImActorModelModulesUpdatesSequenceActor_$1 *new_ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(ImActorModelModulesUpdatesSequenceActor *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUpdatesSequenceActor_$1)

@interface ImActorModelModulesUpdatesSequenceActor_$2 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesUpdatesSequenceActor *this$0_;
  jlong val$loadStart_;
}

- (void)onResult:(APResponseGetDifference *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesUpdatesSequenceActor:(ImActorModelModulesUpdatesSequenceActor *)outer$
                                                       withLong:(jlong)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUpdatesSequenceActor_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesSequenceActor_$2, this$0_, ImActorModelModulesUpdatesSequenceActor *)

__attribute__((unused)) static void ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(ImActorModelModulesUpdatesSequenceActor_$2 *self, ImActorModelModulesUpdatesSequenceActor *outer$, jlong capture$0);

__attribute__((unused)) static ImActorModelModulesUpdatesSequenceActor_$2 *new_ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(ImActorModelModulesUpdatesSequenceActor *outer$, jlong capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUpdatesSequenceActor_$2)

@implementation ImActorModelModulesUpdatesSequenceActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesUpdatesSequenceActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (void)preStart {
  seq_ = [((id<DKPreferencesStorage>) nil_chk([self preferences])) getIntWithKey:ImActorModelModulesUpdatesSequenceActor_KEY_SEQ_ withDefault:-1];
  state_ = [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBytesWithKey:ImActorModelModulesUpdatesSequenceActor_KEY_STATE_];
  parser_ = new_ImActorModelApiParserUpdatesParser_init();
  processor_ = new_ImActorModelModulesUpdatesUpdateProcessor_initWithImActorModelModulesModules_([self modules]);
  [((DKActorRef *) nil_chk([self self__])) sendWithId:new_ImActorModelModulesUpdatesSequenceActor_Invalidate_init()];
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesUpdatesSequenceActor_Invalidate class]] || [message isKindOfClass:[ImActorModelApiBaseSeqUpdateTooLong class]] || [message isKindOfClass:[ImActorModelModulesUpdatesSequenceActor_ForceInvalidate class]]) {
    ImActorModelModulesUpdatesSequenceActor_invalidate(self);
  }
  else if ([message isKindOfClass:[ImActorModelApiBaseSeqUpdate class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else if ([message isKindOfClass:[ImActorModelApiBaseFatSeqUpdate class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else if ([message isKindOfClass:[ImActorModelApiBaseWeakUpdate class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else if ([message isKindOfClass:[ImActorModelModulesUpdatesInternalInternalUpdate class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else if ([message isKindOfClass:[ImActorModelModulesUpdatesInternalExecuteAfter class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else if ([message isKindOfClass:[ImActorModelModulesUpdatesSequenceActor_PushSeq class]]) {
    ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, message);
  }
  else {
    [self dropWithId:message];
  }
}

- (void)onUpdateReceivedWithId:(id)u {
  ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(self, u);
}

- (jboolean)isValidSeqWithInt:(jint)seq {
  return ImActorModelModulesUpdatesSequenceActor_isValidSeqWithInt_(self, seq);
}

- (void)invalidate {
  ImActorModelModulesUpdatesSequenceActor_invalidate(self);
}

- (void)checkFuture {
  ImActorModelModulesUpdatesSequenceActor_checkFuture(self);
}

- (void)checkRunnables {
  ImActorModelModulesUpdatesSequenceActor_checkRunnables(self);
}

@end

void ImActorModelModulesUpdatesSequenceActor_initWithImActorModelModulesModules_(ImActorModelModulesUpdatesSequenceActor *self, ImActorModelModulesModules *modules) {
  (void) ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, modules);
  self->further_ = new_JavaUtilHashMap_init();
  self->pendingRunnables_ = new_JavaUtilArrayList_init();
  self->isValidated_ = YES;
  self->isTimerStarted_ = NO;
}

ImActorModelModulesUpdatesSequenceActor *new_ImActorModelModulesUpdatesSequenceActor_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesUpdatesSequenceActor *self = [ImActorModelModulesUpdatesSequenceActor alloc];
  ImActorModelModulesUpdatesSequenceActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

void ImActorModelModulesUpdatesSequenceActor_onUpdateReceivedWithId_(ImActorModelModulesUpdatesSequenceActor *self, id u) {
  jint seq;
  IOSByteArray *state;
  jint type;
  IOSByteArray *body;
  if ([u isKindOfClass:[ImActorModelApiBaseSeqUpdate class]]) {
    seq = [((ImActorModelApiBaseSeqUpdate *) nil_chk(((ImActorModelApiBaseSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseSeqUpdate class])))) getSeq];
    state = [((ImActorModelApiBaseSeqUpdate *) nil_chk(((ImActorModelApiBaseSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseSeqUpdate class])))) getState];
    type = [((ImActorModelApiBaseSeqUpdate *) nil_chk(((ImActorModelApiBaseSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseSeqUpdate class])))) getUpdateHeader];
    body = [((ImActorModelApiBaseSeqUpdate *) nil_chk(((ImActorModelApiBaseSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseSeqUpdate class])))) getUpdate];
  }
  else if ([u isKindOfClass:[ImActorModelApiBaseFatSeqUpdate class]]) {
    seq = [((ImActorModelApiBaseFatSeqUpdate *) nil_chk(((ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class])))) getSeq];
    state = [((ImActorModelApiBaseFatSeqUpdate *) nil_chk(((ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class])))) getState];
    type = [((ImActorModelApiBaseFatSeqUpdate *) nil_chk(((ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class])))) getUpdateHeader];
    body = [((ImActorModelApiBaseFatSeqUpdate *) nil_chk(((ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class])))) getUpdate];
  }
  else if ([u isKindOfClass:[ImActorModelApiBaseWeakUpdate class]]) {
    ImActorModelApiBaseWeakUpdate *w = (ImActorModelApiBaseWeakUpdate *) check_class_cast(u, [ImActorModelApiBaseWeakUpdate class]);
    @try {
      APUpdate *update = [((ImActorModelApiParserUpdatesParser *) nil_chk(self->parser_)) readWithInt:[((ImActorModelApiBaseWeakUpdate *) nil_chk(w)) getUpdateHeader] withByteArray:[w getUpdate]];
      [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(self->processor_)) processWeakUpdateWithAPUpdate:update withLong:[w getDate]];
      AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, JreStrcat("$@", @"Weak Update: ", update));
    }
    @catch (JavaIoIOException *e) {
      [((JavaIoIOException *) nil_chk(e)) printStackTrace];
      AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Unable to parse update: ignoring");
    }
    return;
  }
  else if ([u isKindOfClass:[ImActorModelModulesUpdatesInternalInternalUpdate class]]) {
    AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Received internal update");
    [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(self->processor_)) processInternalUpdateWithImActorModelModulesUpdatesInternalInternalUpdate:(ImActorModelModulesUpdatesInternalInternalUpdate *) check_class_cast(u, [ImActorModelModulesUpdatesInternalInternalUpdate class])];
    return;
  }
  else if ([u isKindOfClass:[ImActorModelModulesUpdatesInternalExecuteAfter class]]) {
    ImActorModelModulesUpdatesInternalExecuteAfter *after = (ImActorModelModulesUpdatesInternalExecuteAfter *) check_class_cast(u, [ImActorModelModulesUpdatesInternalExecuteAfter class]);
    if ([((ImActorModelModulesUpdatesInternalExecuteAfter *) nil_chk(after)) getSeq] <= self->seq_) {
      [((id<JavaLangRunnable>) nil_chk([after getRunnable])) run];
    }
    else {
      [((JavaUtilArrayList *) nil_chk(self->pendingRunnables_)) addWithId:after];
    }
    return;
  }
  else if ([u isKindOfClass:[ImActorModelModulesUpdatesSequenceActor_PushSeq class]]) {
    ImActorModelModulesUpdatesSequenceActor_PushSeq *pushSeq = (ImActorModelModulesUpdatesSequenceActor_PushSeq *) check_class_cast(u, [ImActorModelModulesUpdatesSequenceActor_PushSeq class]);
    if (((ImActorModelModulesUpdatesSequenceActor_PushSeq *) nil_chk(pushSeq))->seq_ <= self->seq_) {
      AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, JreStrcat("$IC", @"Ignored PushSeq {seq:", pushSeq->seq_, '}'));
    }
    else {
      AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"External Out of sequence: starting timer for invalidation");
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() withLong:ImActorModelModulesUpdatesSequenceActor_INVALIDATE_GAP];
    }
    return;
  }
  else {
    return;
  }
  if (seq <= self->seq_) {
    AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, JreStrcat("$I$IC", @"Ignored SeqUpdate {seq:", seq, @", currentSeq: ", self->seq_, '}'));
    return;
  }
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, JreStrcat("$IC", @"SeqUpdate {seq:", seq, '}'));
  if (!self->isValidated_) {
    AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Caching in further map");
    (void) [((JavaUtilHashMap *) nil_chk(self->further_)) putWithId:JavaLangInteger_valueOfWithInt_(seq) withId:u];
    return;
  }
  if (!ImActorModelModulesUpdatesSequenceActor_isValidSeqWithInt_(self, seq)) {
    (void) [((JavaUtilHashMap *) nil_chk(self->further_)) putWithId:JavaLangInteger_valueOfWithInt_(seq) withId:u];
    if (seq - self->seq_ > ImActorModelModulesUpdatesSequenceActor_INVALIDATE_MAX_SEC_HOLE) {
      AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Out of sequence: Too big hole. Force invalidate immediately");
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init()];
      return;
    }
    if (self->isTimerStarted_) {
      AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Out of sequence: timer already started");
    }
    else {
      AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Out of sequence: starting timer for invalidation");
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() withLong:ImActorModelModulesUpdatesSequenceActor_INVALIDATE_GAP];
      self->isTimerStarted_ = YES;
    }
    return;
  }
  APUpdate *update;
  @try {
    update = [new_ImActorModelApiParserUpdatesParser_init() readWithInt:type withByteArray:body];
  }
  @catch (JavaIoIOException *e) {
    AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Unable to parse update: ignoring");
    [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    return;
  }
  if ((!([u isKindOfClass:[ImActorModelApiBaseFatSeqUpdate class]])) && [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(self->processor_)) isCausesInvalidationWithAPUpdate:update]) {
    AMLog_wWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Message causes invalidation");
    ImActorModelModulesUpdatesSequenceActor_invalidate(self);
    return;
  }
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, JreStrcat("$@", @"Processing update: ", update));
  if ([u isKindOfClass:[ImActorModelApiBaseFatSeqUpdate class]]) {
    ImActorModelApiBaseFatSeqUpdate *fatSeqUpdate = (ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class]);
    [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(self->processor_)) applyRelatedWithJavaUtilList:[((ImActorModelApiBaseFatSeqUpdate *) nil_chk(fatSeqUpdate)) getUsers] withJavaUtilList:[fatSeqUpdate getGroups] withBoolean:NO];
  }
  [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(self->processor_)) processUpdateWithAPUpdate:update];
  if ([u isKindOfClass:[ImActorModelApiBaseFatSeqUpdate class]]) {
    ImActorModelApiBaseFatSeqUpdate *fatSeqUpdate = (ImActorModelApiBaseFatSeqUpdate *) check_class_cast(u, [ImActorModelApiBaseFatSeqUpdate class]);
    [self->processor_ applyRelatedWithJavaUtilList:[((ImActorModelApiBaseFatSeqUpdate *) nil_chk(fatSeqUpdate)) getUsers] withJavaUtilList:[fatSeqUpdate getGroups] withBoolean:YES];
  }
  self->seq_ = seq;
  self->state_ = state;
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putIntWithKey:ImActorModelModulesUpdatesSequenceActor_KEY_SEQ_ withValue:seq];
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBytesWithKey:ImActorModelModulesUpdatesSequenceActor_KEY_STATE_ withValue:state];
  ImActorModelModulesUpdatesSequenceActor_checkRunnables(self);
  ImActorModelModulesUpdatesSequenceActor_checkFuture(self);
  self->isTimerStarted_ = NO;
  [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() withLong:24 * 60 * 60 * 1000LL];
}

jboolean ImActorModelModulesUpdatesSequenceActor_isValidSeqWithInt_(ImActorModelModulesUpdatesSequenceActor *self, jint seq) {
  return self->seq_ <= 0 || seq == self->seq_ + 1;
}

void ImActorModelModulesUpdatesSequenceActor_invalidate(ImActorModelModulesUpdatesSequenceActor *self) {
  if (!self->isValidated_) {
    return;
  }
  self->isValidated_ = NO;
  if (self->seq_ < 0) {
    AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Loading fresh state...");
    [self requestWithAPRequest:new_APRequestGetState_init() withAMRpcCallback:new_ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(self)];
  }
  else {
    AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_TAG_, @"Loading difference...");
    jlong loadStart = DKEnvironment_getCurrentTime();
    [self requestWithAPRequest:new_APRequestGetDifference_initWithInt_withByteArray_(self->seq_, self->state_) withAMRpcCallback:new_ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(self, loadStart)];
  }
}

void ImActorModelModulesUpdatesSequenceActor_checkFuture(ImActorModelModulesUpdatesSequenceActor *self) {
  for (jint i = self->seq_ + 1; ; i++) {
    if ([((JavaUtilHashMap *) nil_chk(self->further_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_(i)]) {
      [self onReceiveWithId:[self->further_ removeWithId:JavaLangInteger_valueOfWithInt_(i)]];
    }
    else {
      break;
    }
  }
  [((JavaUtilHashMap *) nil_chk(self->further_)) clear];
}

void ImActorModelModulesUpdatesSequenceActor_checkRunnables(ImActorModelModulesUpdatesSequenceActor *self) {
  if ([((JavaUtilArrayList *) nil_chk(self->pendingRunnables_)) size] > 0) {
    {
      IOSObjectArray *a__ = [self->pendingRunnables_ toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[self->pendingRunnables_ size] type:ImActorModelModulesUpdatesInternalExecuteAfter_class_()]];
      ImActorModelModulesUpdatesInternalExecuteAfter * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
      ImActorModelModulesUpdatesInternalExecuteAfter * const *e__ = b__ + a__->size_;
      while (b__ < e__) {
        ImActorModelModulesUpdatesInternalExecuteAfter *e = *b__++;
        if ([((ImActorModelModulesUpdatesInternalExecuteAfter *) nil_chk(e)) getSeq] <= self->seq_) {
          [((id<JavaLangRunnable>) nil_chk([e getRunnable])) run];
          [self->pendingRunnables_ removeWithId:e];
        }
      }
    }
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor)

@implementation ImActorModelModulesUpdatesSequenceActor_ForceInvalidate

- (instancetype)init {
  ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init(self);
  return self;
}

@end

void ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init(ImActorModelModulesUpdatesSequenceActor_ForceInvalidate *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesUpdatesSequenceActor_ForceInvalidate *new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() {
  ImActorModelModulesUpdatesSequenceActor_ForceInvalidate *self = [ImActorModelModulesUpdatesSequenceActor_ForceInvalidate alloc];
  ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor_ForceInvalidate)

@implementation ImActorModelModulesUpdatesSequenceActor_Invalidate

- (instancetype)init {
  ImActorModelModulesUpdatesSequenceActor_Invalidate_init(self);
  return self;
}

@end

void ImActorModelModulesUpdatesSequenceActor_Invalidate_init(ImActorModelModulesUpdatesSequenceActor_Invalidate *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesUpdatesSequenceActor_Invalidate *new_ImActorModelModulesUpdatesSequenceActor_Invalidate_init() {
  ImActorModelModulesUpdatesSequenceActor_Invalidate *self = [ImActorModelModulesUpdatesSequenceActor_Invalidate alloc];
  ImActorModelModulesUpdatesSequenceActor_Invalidate_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor_Invalidate)

@implementation ImActorModelModulesUpdatesSequenceActor_PushSeq

- (instancetype)initWithInt:(jint)seq {
  ImActorModelModulesUpdatesSequenceActor_PushSeq_initWithInt_(self, seq);
  return self;
}

@end

void ImActorModelModulesUpdatesSequenceActor_PushSeq_initWithInt_(ImActorModelModulesUpdatesSequenceActor_PushSeq *self, jint seq) {
  (void) NSObject_init(self);
  self->seq_ = seq;
}

ImActorModelModulesUpdatesSequenceActor_PushSeq *new_ImActorModelModulesUpdatesSequenceActor_PushSeq_initWithInt_(jint seq) {
  ImActorModelModulesUpdatesSequenceActor_PushSeq *self = [ImActorModelModulesUpdatesSequenceActor_PushSeq alloc];
  ImActorModelModulesUpdatesSequenceActor_PushSeq_initWithInt_(self, seq);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor_PushSeq)

@implementation ImActorModelModulesUpdatesSequenceActor_$1

- (void)onResult:(APResponseSeq *)response {
  if (this$0_->isValidated_) {
    return;
  }
  this$0_->seq_ = [((APResponseSeq *) nil_chk(response)) getSeq];
  this$0_->state_ = [response getState];
  this$0_->isValidated_ = YES;
  [((id<DKPreferencesStorage>) nil_chk([this$0_ preferences])) putIntWithKey:ImActorModelModulesUpdatesSequenceActor_get_KEY_SEQ_() withValue:this$0_->seq_];
  [((id<DKPreferencesStorage>) nil_chk([this$0_ preferences])) putBytesWithKey:ImActorModelModulesUpdatesSequenceActor_get_KEY_STATE_() withValue:this$0_->state_];
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_get_TAG_(), JreStrcat("$IC", @"State loaded {seq=", this$0_->seq_, '}'));
  ImActorModelModulesUpdatesSequenceActor_checkRunnables(this$0_);
  ImActorModelModulesUpdatesSequenceActor_checkFuture(this$0_);
  this$0_->isTimerStarted_ = NO;
  [((DKActorRef *) nil_chk([this$0_ self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() withLong:24 * 60 * 60 * 1000LL];
}

- (void)onError:(AMRpcException *)e {
  if (this$0_->isValidated_) {
    return;
  }
  this$0_->isValidated_ = YES;
  ImActorModelModulesUpdatesSequenceActor_invalidate(this$0_);
}

- (instancetype)initWithImActorModelModulesUpdatesSequenceActor:(ImActorModelModulesUpdatesSequenceActor *)outer$ {
  ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(self, outer$);
  return self;
}

@end

void ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(ImActorModelModulesUpdatesSequenceActor_$1 *self, ImActorModelModulesUpdatesSequenceActor *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesUpdatesSequenceActor_$1 *new_ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(ImActorModelModulesUpdatesSequenceActor *outer$) {
  ImActorModelModulesUpdatesSequenceActor_$1 *self = [ImActorModelModulesUpdatesSequenceActor_$1 alloc];
  ImActorModelModulesUpdatesSequenceActor_$1_initWithImActorModelModulesUpdatesSequenceActor_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor_$1)

@implementation ImActorModelModulesUpdatesSequenceActor_$2

- (void)onResult:(APResponseGetDifference *)response {
  if (this$0_->isValidated_) {
    return;
  }
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_get_TAG_(), JreStrcat("$I$J$", @"Difference loaded {seq=", [((APResponseGetDifference *) nil_chk(response)) getSeq], @"} in ", (DKEnvironment_getCurrentTime() - val$loadStart_), @" ms"));
  jlong parseStart = DKEnvironment_getCurrentTime();
  JavaUtilArrayList *updates = new_JavaUtilArrayList_init();
  for (APDifferenceUpdate * __strong u in nil_chk([response getUpdates])) {
    @try {
      [updates addWithId:[((ImActorModelApiParserUpdatesParser *) nil_chk(this$0_->parser_)) readWithInt:[((APDifferenceUpdate *) nil_chk(u)) getUpdateHeader] withByteArray:[u getUpdate]]];
    }
    @catch (JavaIoIOException *e) {
      [((JavaIoIOException *) nil_chk(e)) printStackTrace];
      AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_get_TAG_(), JreStrcat("$I$", @"Broken update #", [((APDifferenceUpdate *) nil_chk(u)) getUpdateHeader], @": ignoring"));
    }
  }
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_get_TAG_(), JreStrcat("$J$", @"Difference parsed  in ", (DKEnvironment_getCurrentTime() - parseStart), @" ms"));
  jlong applyStart = DKEnvironment_getCurrentTime();
  [((ImActorModelModulesUpdatesUpdateProcessor *) nil_chk(this$0_->processor_)) applyDifferenceUpdateWithJavaUtilList:[response getUsers] withJavaUtilList:[response getGroups] withJavaUtilList:updates];
  AMLog_dWithNSString_withNSString_(ImActorModelModulesUpdatesSequenceActor_get_TAG_(), JreStrcat("$J$", @"Difference applied in ", (DKEnvironment_getCurrentTime() - applyStart), @" ms"));
  this$0_->seq_ = [response getSeq];
  this$0_->state_ = [response getState];
  this$0_->isValidated_ = YES;
  [((id<DKPreferencesStorage>) nil_chk([this$0_ preferences])) putIntWithKey:ImActorModelModulesUpdatesSequenceActor_get_KEY_SEQ_() withValue:this$0_->seq_];
  [((id<DKPreferencesStorage>) nil_chk([this$0_ preferences])) putBytesWithKey:ImActorModelModulesUpdatesSequenceActor_get_KEY_STATE_() withValue:this$0_->state_];
  ImActorModelModulesUpdatesSequenceActor_checkRunnables(this$0_);
  ImActorModelModulesUpdatesSequenceActor_checkFuture(this$0_);
  this$0_->isTimerStarted_ = NO;
  [((DKActorRef *) nil_chk([this$0_ self__])) sendOnceWithId:new_ImActorModelModulesUpdatesSequenceActor_ForceInvalidate_init() withLong:24 * 60 * 60 * 1000LL];
  if ([response needMore]) {
    ImActorModelModulesUpdatesSequenceActor_invalidate(this$0_);
  }
}

- (void)onError:(AMRpcException *)e {
  if (this$0_->isValidated_) {
    return;
  }
  this$0_->isValidated_ = YES;
  ImActorModelModulesUpdatesSequenceActor_invalidate(this$0_);
}

- (instancetype)initWithImActorModelModulesUpdatesSequenceActor:(ImActorModelModulesUpdatesSequenceActor *)outer$
                                                       withLong:(jlong)capture$0 {
  ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(ImActorModelModulesUpdatesSequenceActor_$2 *self, ImActorModelModulesUpdatesSequenceActor *outer$, jlong capture$0) {
  self->this$0_ = outer$;
  self->val$loadStart_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesUpdatesSequenceActor_$2 *new_ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(ImActorModelModulesUpdatesSequenceActor *outer$, jlong capture$0) {
  ImActorModelModulesUpdatesSequenceActor_$2 *self = [ImActorModelModulesUpdatesSequenceActor_$2 alloc];
  ImActorModelModulesUpdatesSequenceActor_$2_initWithImActorModelModulesUpdatesSequenceActor_withLong_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesSequenceActor_$2)