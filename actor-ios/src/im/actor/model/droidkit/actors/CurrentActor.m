//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/actors/CurrentActor.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/CurrentActor.h"
#include "java/lang/ThreadLocal.h"

@interface DKCurrentActor () {
}
@end

BOOL DKCurrentActor_initialized = NO;

@implementation DKCurrentActor

JavaLangThreadLocal * DKCurrentActor_currentActor_;

+ (void)setCurrentActorWithDKActor:(DKActor *)actor {
  DKCurrentActor_setCurrentActorWithDKActor_(actor);
}

+ (DKActor *)getCurrentActor {
  return DKCurrentActor_getCurrentActor();
}

- (instancetype)init {
  return [super init];
}

+ (void)initialize {
  if (self == [DKCurrentActor class]) {
    DKCurrentActor_currentActor_ = [[JavaLangThreadLocal alloc] init];
    J2OBJC_SET_INITIALIZED(DKCurrentActor)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "setCurrentActorWithDKActor:", "setCurrentActor", "V", 0x9, NULL },
    { "getCurrentActor", NULL, "Lim.actor.model.droidkit.actors.Actor;", 0x9, NULL },
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "currentActor_", NULL, 0xa, "Ljava.lang.ThreadLocal;", &DKCurrentActor_currentActor_,  },
  };
  static const J2ObjcClassInfo _DKCurrentActor = { 1, "CurrentActor", "im.actor.model.droidkit.actors", NULL, 0x1, 3, methods, 1, fields, 0, NULL};
  return &_DKCurrentActor;
}

@end

void DKCurrentActor_setCurrentActorWithDKActor_(DKActor *actor) {
  DKCurrentActor_init();
  [((JavaLangThreadLocal *) nil_chk(DKCurrentActor_currentActor_)) setWithId:actor];
}

DKActor *DKCurrentActor_getCurrentActor() {
  DKCurrentActor_init();
  return [((JavaLangThreadLocal *) nil_chk(DKCurrentActor_currentActor_)) get];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKCurrentActor)