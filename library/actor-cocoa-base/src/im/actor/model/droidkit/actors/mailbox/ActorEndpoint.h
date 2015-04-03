//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/mailbox/ActorEndpoint.java
//

#ifndef _DKActorEndpoint_H_
#define _DKActorEndpoint_H_

@class DKActorScope;
@class DKMailbox;

#include "J2ObjC_header.h"

@interface DKActorEndpoint : NSObject {
}

- (instancetype)initWithNSString:(NSString *)path;

- (NSString *)getPath;

- (DKMailbox *)getMailbox;

- (DKActorScope *)getScope;

- (jboolean)isDisconnected;

- (void)connectWithDKMailbox:(DKMailbox *)mailbox
            withDKActorScope:(DKActorScope *)scope;

@end

J2OBJC_EMPTY_STATIC_INIT(DKActorEndpoint)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

typedef DKActorEndpoint ImActorModelDroidkitActorsMailboxActorEndpoint;

J2OBJC_TYPE_LITERAL_HEADER(DKActorEndpoint)

#endif // _DKActorEndpoint_H_