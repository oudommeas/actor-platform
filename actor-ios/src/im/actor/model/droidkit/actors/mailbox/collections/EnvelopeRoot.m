//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/actors/mailbox/collections/EnvelopeRoot.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorTime.h"
#include "im/actor/model/droidkit/actors/Environment.h"
#include "im/actor/model/droidkit/actors/mailbox/Envelope.h"
#include "im/actor/model/droidkit/actors/mailbox/MailboxesQueue.h"
#include "im/actor/model/droidkit/actors/mailbox/collections/EnvelopeCollection.h"
#include "im/actor/model/droidkit/actors/mailbox/collections/EnvelopeRoot.h"
#include "im/actor/model/droidkit/actors/mailbox/collections/ScheduledEnvelope.h"
#include "im/actor/model/util/ThreadLocalCompat.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/util/HashMap.h"
#include "java/util/HashSet.h"
#include "java/util/Iterator.h"
#include "java/util/Map.h"
#include "java/util/TreeMap.h"

@interface ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot () {
 @public
  JavaUtilHashSet *usedSlot_;
  JavaUtilHashMap *collections_;
  JavaUtilHashMap *lastTopKey_;
  JavaUtilTreeMap *sortedCollection_;
  DKMailboxesQueue *queue_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot, usedSlot_, JavaUtilHashSet *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot, collections_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot, lastTopKey_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot, sortedCollection_, JavaUtilTreeMap *)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot, queue_, DKMailboxesQueue *)

@interface ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult () {
 @public
  DKEnvelope *envelope__;
  jlong delay__;
}
- (instancetype)initWithDKEnvelope:(DKEnvelope *)envelope;
- (instancetype)initWithLong:(jlong)delay;
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult, envelope__, DKEnvelope *)

@implementation ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot

- (instancetype)initWithDKMailboxesQueue:(DKMailboxesQueue *)queue {
  if (self = [super init]) {
    usedSlot_ = [[JavaUtilHashSet alloc] init];
    collections_ = [[JavaUtilHashMap alloc] init];
    lastTopKey_ = [[JavaUtilHashMap alloc] init];
    sortedCollection_ = [[JavaUtilTreeMap alloc] init];
    self->queue_ = queue;
  }
  return self;
}

- (void)attachCollectionWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *)collection {
  @synchronized(self) {
    jlong key = [((ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *) nil_chk(collection)) getTopKey];
    if (![((JavaUtilHashMap *) nil_chk(collections_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_([collection getId])]) {
      (void) [collections_ putWithId:JavaLangInteger_valueOfWithInt_([collection getId]) withId:collection];
      (void) [((JavaUtilHashMap *) nil_chk(lastTopKey_)) putWithId:JavaLangInteger_valueOfWithInt_([collection getId]) withId:JavaLangLong_valueOfWithLong_(key)];
      if (key > 0) {
        (void) [((JavaUtilTreeMap *) nil_chk(sortedCollection_)) putWithId:JavaLangLong_valueOfWithLong_(key) withId:collection];
      }
    }
    [((DKMailboxesQueue *) nil_chk(queue_)) notifyQueueChanged];
  }
}

- (void)detachCollectionWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *)collection {
  @synchronized(self) {
    if (![((JavaUtilHashMap *) nil_chk(collections_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *) nil_chk(collection)) getId])]) {
      return;
    }
    (void) [collections_ removeWithId:JavaLangInteger_valueOfWithInt_([collection getId])];
    JavaLangLong *prevKey = [((JavaUtilHashMap *) nil_chk(lastTopKey_)) getWithId:JavaLangInteger_valueOfWithInt_([collection getId])];
    (void) [lastTopKey_ removeWithId:JavaLangInteger_valueOfWithInt_([collection getId])];
    if ([((JavaLangLong *) nil_chk(prevKey)) longLongValue] > 0) {
      (void) [((JavaUtilTreeMap *) nil_chk(sortedCollection_)) removeWithId:prevKey];
    }
  }
}

- (ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *)fetchCollectionWithLong:(jlong)time {
  @synchronized(self) {
    id<JavaUtilMap_Entry> res = [((JavaUtilTreeMap *) nil_chk(sortedCollection_)) isEmpty] ? nil : [sortedCollection_ firstEntry];
    if (res != nil) {
      ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *collection = [res getValue];
      ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection_FetchResult *envelope = [((ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *) nil_chk(collection)) fetchEnvelopeWithLong:time];
      if (envelope != nil) {
        if ([envelope getEnvelope] != nil) {
          [self detachCollectionWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:collection];
          ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *result = ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_envelopeWithDKEnvelope_([((ImActorModelDroidkitActorsMailboxCollectionsScheduledEnvelope *) nil_chk([envelope getEnvelope])) getEnvelope]);
          [envelope recycle];
          return result;
        }
        else {
          ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *result = ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_delayWithLong_([envelope getDelay]);
          [envelope recycle];
          return result;
        }
      }
      else {
        return nil;
      }
    }
    else {
      return nil;
    }
  }
}

- (void)changedTopKeyWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *)collection {
  @synchronized(self) {
    if (![((JavaUtilHashMap *) nil_chk(collections_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_([((ImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection *) nil_chk(collection)) getId])]) {
      return;
    }
    jlong key = [collection getTopKey];
    JavaLangLong *prevKey = [((JavaUtilHashMap *) nil_chk(lastTopKey_)) getWithId:JavaLangInteger_valueOfWithInt_([collection getId])];
    (void) [lastTopKey_ removeWithId:JavaLangInteger_valueOfWithInt_([collection getId])];
    if ([((JavaLangLong *) nil_chk(prevKey)) longLongValue] > 0) {
      (void) [((JavaUtilTreeMap *) nil_chk(sortedCollection_)) removeWithId:prevKey];
    }
    (void) [lastTopKey_ putWithId:JavaLangInteger_valueOfWithInt_([collection getId]) withId:JavaLangLong_valueOfWithLong_(key)];
    if (key > 0) {
      (void) [((JavaUtilTreeMap *) nil_chk(sortedCollection_)) putWithId:JavaLangLong_valueOfWithLong_(key) withId:collection];
    }
    [((DKMailboxesQueue *) nil_chk(queue_)) notifyQueueChanged];
  }
}

- (jlong)buildKeyWithLong:(jlong)time {
  @synchronized(self) {
    jlong currentTime = DKActorTime_currentTime();
    if (time < currentTime) {
      time = currentTime;
    }
    id<JavaUtilIterator> iterator = [((JavaUtilHashSet *) nil_chk(usedSlot_)) iterator];
    while ([((id<JavaUtilIterator>) nil_chk(iterator)) hasNext]) {
      jlong t = [((JavaLangLong *) nil_chk([iterator next])) longLongValue];
      if (t < currentTime * ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_MULTIPLE) {
        [iterator remove];
      }
    }
    jlong shift = 0;
    while ([usedSlot_ containsWithId:JavaLangLong_valueOfWithLong_(time * ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_MULTIPLE + shift)]) {
      shift++;
    }
    [usedSlot_ addWithId:JavaLangLong_valueOfWithLong_(time * ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_MULTIPLE + shift)];
    return time * ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_MULTIPLE + shift;
  }
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot *)other {
  [super copyAllFieldsTo:other];
  other->usedSlot_ = usedSlot_;
  other->collections_ = collections_;
  other->lastTopKey_ = lastTopKey_;
  other->sortedCollection_ = sortedCollection_;
  other->queue_ = queue_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithDKMailboxesQueue:", "EnvelopeRoot", NULL, 0x1, NULL },
    { "attachCollectionWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:", "attachCollection", "V", 0x21, NULL },
    { "detachCollectionWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:", "detachCollection", "V", 0x21, NULL },
    { "fetchCollectionWithLong:", "fetchCollection", "Lim.actor.model.droidkit.actors.mailbox.collections.EnvelopeRoot$FetchResult;", 0x21, NULL },
    { "changedTopKeyWithImActorModelDroidkitActorsMailboxCollectionsEnvelopeCollection:", "changedTopKey", "V", 0x20, NULL },
    { "buildKeyWithLong:", "buildKey", "J", 0x20, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "MULTIPLE_", NULL, 0x1a, "J", NULL, .constantValue.asLong = ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_MULTIPLE },
    { "usedSlot_", NULL, 0x12, "Ljava.util.HashSet;", NULL,  },
    { "collections_", NULL, 0x12, "Ljava.util.HashMap;", NULL,  },
    { "lastTopKey_", NULL, 0x12, "Ljava.util.HashMap;", NULL,  },
    { "sortedCollection_", NULL, 0x12, "Ljava.util.TreeMap;", NULL,  },
    { "queue_", NULL, 0x2, "Lim.actor.model.droidkit.actors.mailbox.MailboxesQueue;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot = { 1, "EnvelopeRoot", "im.actor.model.droidkit.actors.mailbox.collections", NULL, 0x1, 6, methods, 6, fields, 0, NULL};
  return &_ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot)

BOOL ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_initialized = NO;

@implementation ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult

AMThreadLocalCompat * ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_;

+ (ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *)envelopeWithDKEnvelope:(DKEnvelope *)envelope {
  return ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_envelopeWithDKEnvelope_(envelope);
}

+ (ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *)delayWithLong:(jlong)delay {
  return ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_delayWithLong_(delay);
}

- (instancetype)initWithDKEnvelope:(DKEnvelope *)envelope {
  if (self = [super init]) {
    self->envelope__ = envelope;
  }
  return self;
}

- (instancetype)initWithLong:(jlong)delay {
  if (self = [super init]) {
    self->delay__ = delay;
  }
  return self;
}

- (DKEnvelope *)getEnvelope {
  return envelope__;
}

- (jlong)getDelay {
  return delay__;
}

- (void)updateWithDKEnvelope:(DKEnvelope *)envelope
                    withLong:(jlong)delay {
  self->envelope__ = envelope;
  self->delay__ = delay;
}

- (void)recycle {
  [((AMThreadLocalCompat *) nil_chk(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_)) setWithId:self];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *)other {
  [super copyAllFieldsTo:other];
  other->envelope__ = envelope__;
  other->delay__ = delay__;
}

+ (void)initialize {
  if (self == [ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult class]) {
    ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_ = DKEnvironment_createThreadLocal();
    J2OBJC_SET_INITIALIZED(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "envelopeWithDKEnvelope:", "envelope", "Lim.actor.model.droidkit.actors.mailbox.collections.EnvelopeRoot$FetchResult;", 0x9, NULL },
    { "delayWithLong:", "delay", "Lim.actor.model.droidkit.actors.mailbox.collections.EnvelopeRoot$FetchResult;", 0x9, NULL },
    { "initWithDKEnvelope:", "FetchResult", NULL, 0x2, NULL },
    { "initWithLong:", "FetchResult", NULL, 0x2, NULL },
    { "getEnvelope", NULL, "Lim.actor.model.droidkit.actors.mailbox.Envelope;", 0x1, NULL },
    { "getDelay", NULL, "J", 0x1, NULL },
    { "updateWithDKEnvelope:withLong:", "update", "V", 0x1, NULL },
    { "recycle", NULL, "V", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "RESULT_CACHE_", NULL, 0xa, "Lim.actor.model.util.ThreadLocalCompat;", &ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_,  },
    { "envelope__", "envelope", 0x2, "Lim.actor.model.droidkit.actors.mailbox.Envelope;", NULL,  },
    { "delay__", "delay", 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult = { 1, "FetchResult", "im.actor.model.droidkit.actors.mailbox.collections", "EnvelopeRoot", 0x9, 8, methods, 3, fields, 0, NULL};
  return &_ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult;
}

@end

ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_envelopeWithDKEnvelope_(DKEnvelope *envelope) {
  ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_init();
  ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *res = [((AMThreadLocalCompat *) nil_chk(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_)) get];
  if (res != nil) {
    [ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_ remove];
    [res updateWithDKEnvelope:envelope withLong:0];
  }
  else {
    res = [[ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult alloc] initWithDKEnvelope:envelope];
  }
  return res;
}

ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_delayWithLong_(jlong delay) {
  ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_init();
  ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult *res = [((AMThreadLocalCompat *) nil_chk(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_)) get];
  if (res != nil) {
    [ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult_RESULT_CACHE_ remove];
    [res updateWithDKEnvelope:nil withLong:delay];
  }
  else {
    res = [[ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult alloc] initWithLong:delay];
  }
  return res;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsMailboxCollectionsEnvelopeRoot_FetchResult)