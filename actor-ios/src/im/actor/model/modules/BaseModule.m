//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/BaseModule.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/MainThread.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/network/parser/Request.h"
#include "im/actor/model/network/parser/Response.h"
#include "im/actor/model/storage/KeyValueEngine.h"
#include "im/actor/model/storage/PreferencesStorage.h"
#include "java/lang/Runnable.h"

@interface ImActorModelModulesBaseModule () {
 @public
  ImActorModelModulesModules *modules__;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesBaseModule, modules__, ImActorModelModulesModules *)

@implementation ImActorModelModulesBaseModule

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  if (self = [super init]) {
    self->modules__ = modules;
  }
  return self;
}

- (ImActorModelModulesModules *)modules {
  return modules__;
}

- (ImActorModelModulesUpdates *)updates {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getUpdatesModule];
}

- (void)runOnUiThreadWithJavaLangRunnable:(id<JavaLangRunnable>)runnable {
  [((id<AMMainThread>) nil_chk([((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getConfiguration])) getMainThread])) runOnUiThread:runnable];
}

- (DKActorRef *)sendActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getSendMessageActor];
}

- (DKActorRef *)dialogsActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsActor];
}

- (DKActorRef *)dialogsHistoryActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsHistoryActor];
}

- (DKActorRef *)ownReadActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getOwnReadActor];
}

- (DKActorRef *)plainReceiveActor {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getPlainReceiverActor];
}

- (DKActorRef *)conversationActorWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getConversationActorWithAMPeer:peer];
}

- (id<AMPreferencesStorage>)preferences {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getPreferences];
}

- (jint)myUid {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getAuthModule])) myUid];
}

- (void)requestWithImActorModelNetworkParserRequest:(ImActorModelNetworkParserRequest *)request
                                  withAMRpcCallback:(id<AMRpcCallback>)callback {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getActorApi])) requestWithImActorModelNetworkParserRequest:request withAMRpcCallback:callback];
}

- (void)requestWithImActorModelNetworkParserRequest:(ImActorModelNetworkParserRequest *)request {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getActorApi])) requestWithImActorModelNetworkParserRequest:request withAMRpcCallback:[[ImActorModelModulesBaseModule_$1 alloc] init]];
}

- (id<AMKeyValueEngine>)users {
  return [((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getUsersModule])) getUsers];
}

- (id<AMKeyValueEngine>)groups {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getGroupsModule])) getGroups];
}

- (void)copyAllFieldsTo:(ImActorModelModulesBaseModule *)other {
  [super copyAllFieldsTo:other];
  other->modules__ = modules__;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesBaseModule)

@implementation ImActorModelModulesBaseModule_$1

- (void)onResultWithImActorModelNetworkParserResponse:(ImActorModelNetworkParserResponse *)response {
}

- (void)onErrorWithAMRpcException:(AMRpcException *)e {
}

- (instancetype)init {
  return [super init];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesBaseModule_$1)
