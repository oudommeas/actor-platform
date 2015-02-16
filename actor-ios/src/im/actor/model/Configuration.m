//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/Configuration.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/LogCallback.h"
#include "im/actor/model/MainThread.h"
#include "im/actor/model/MessengerCallback.h"
#include "im/actor/model/Networking.h"
#include "im/actor/model/Storage.h"
#include "im/actor/model/Threading.h"

@interface AMConfiguration () {
 @public
  id<AMNetworking> networking_;
  IOSObjectArray *endpoints_;
  id<AMThreading> threading_;
  id<AMMainThread> mainThread_;
  id<AMStorage> storage_;
  id<AMMessengerCallback> callback_;
  id<AMLogCallback> log_;
}
@end

J2OBJC_FIELD_SETTER(AMConfiguration, networking_, id<AMNetworking>)
J2OBJC_FIELD_SETTER(AMConfiguration, endpoints_, IOSObjectArray *)
J2OBJC_FIELD_SETTER(AMConfiguration, threading_, id<AMThreading>)
J2OBJC_FIELD_SETTER(AMConfiguration, mainThread_, id<AMMainThread>)
J2OBJC_FIELD_SETTER(AMConfiguration, storage_, id<AMStorage>)
J2OBJC_FIELD_SETTER(AMConfiguration, callback_, id<AMMessengerCallback>)
J2OBJC_FIELD_SETTER(AMConfiguration, log_, id<AMLogCallback>)

@implementation AMConfiguration

- (instancetype)initWithAMNetworking:(id<AMNetworking>)networking
       withAMConnectionEndpointArray:(IOSObjectArray *)endpoints
                     withAMThreading:(id<AMThreading>)threading
                    withAMMainThread:(id<AMMainThread>)mainThread
                       withAMStorage:(id<AMStorage>)storage
             withAMMessengerCallback:(id<AMMessengerCallback>)callback
                   withAMLogCallback:(id<AMLogCallback>)log {
  if (self = [super init]) {
    self->networking_ = networking;
    self->endpoints_ = endpoints;
    self->threading_ = threading;
    self->mainThread_ = mainThread;
    self->storage_ = storage;
    self->callback_ = callback;
    self->log_ = log;
  }
  return self;
}

- (id<AMNetworking>)getNetworking {
  return networking_;
}

- (IOSObjectArray *)getEndpoints {
  return endpoints_;
}

- (id<AMThreading>)getThreading {
  return threading_;
}

- (id<AMMainThread>)getMainThread {
  return mainThread_;
}

- (id<AMStorage>)getStorage {
  return storage_;
}

- (id<AMMessengerCallback>)getCallback {
  return callback_;
}

- (id<AMLogCallback>)getLog {
  return log_;
}

- (void)copyAllFieldsTo:(AMConfiguration *)other {
  [super copyAllFieldsTo:other];
  other->networking_ = networking_;
  other->endpoints_ = endpoints_;
  other->threading_ = threading_;
  other->mainThread_ = mainThread_;
  other->storage_ = storage_;
  other->callback_ = callback_;
  other->log_ = log_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithAMNetworking:withAMConnectionEndpointArray:withAMThreading:withAMMainThread:withAMStorage:withAMMessengerCallback:withAMLogCallback:", "Configuration", NULL, 0x1, NULL },
    { "getNetworking", NULL, "Lim.actor.model.Networking;", 0x1, NULL },
    { "getEndpoints", NULL, "[Lim.actor.model.network.ConnectionEndpoint;", 0x1, NULL },
    { "getThreading", NULL, "Lim.actor.model.Threading;", 0x1, NULL },
    { "getMainThread", NULL, "Lim.actor.model.MainThread;", 0x1, NULL },
    { "getStorage", NULL, "Lim.actor.model.Storage;", 0x1, NULL },
    { "getCallback", NULL, "Lim.actor.model.MessengerCallback;", 0x1, NULL },
    { "getLog", NULL, "Lim.actor.model.LogCallback;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "networking_", NULL, 0x12, "Lim.actor.model.Networking;", NULL,  },
    { "endpoints_", NULL, 0x12, "[Lim.actor.model.network.ConnectionEndpoint;", NULL,  },
    { "threading_", NULL, 0x12, "Lim.actor.model.Threading;", NULL,  },
    { "mainThread_", NULL, 0x12, "Lim.actor.model.MainThread;", NULL,  },
    { "storage_", NULL, 0x12, "Lim.actor.model.Storage;", NULL,  },
    { "callback_", NULL, 0x12, "Lim.actor.model.MessengerCallback;", NULL,  },
    { "log_", NULL, 0x12, "Lim.actor.model.LogCallback;", NULL,  },
  };
  static const J2ObjcClassInfo _AMConfiguration = { 1, "Configuration", "im.actor.model", NULL, 0x1, 8, methods, 7, fields, 0, NULL};
  return &_AMConfiguration;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMConfiguration)