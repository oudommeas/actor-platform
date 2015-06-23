//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/library/core/src/main/java/im/actor/model/api/rpc/RequestTerminateSession.java
//

#ifndef _APRequestTerminateSession_H_
#define _APRequestTerminateSession_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APRequestTerminateSession_HEADER 82

@interface APRequestTerminateSession : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithInt:(jint)id_;

+ (APRequestTerminateSession *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (jint)getId;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestTerminateSession)

J2OBJC_STATIC_FIELD_GETTER(APRequestTerminateSession, HEADER, jint)

FOUNDATION_EXPORT APRequestTerminateSession *APRequestTerminateSession_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestTerminateSession_initWithInt_(APRequestTerminateSession *self, jint id_);

FOUNDATION_EXPORT APRequestTerminateSession *new_APRequestTerminateSession_initWithInt_(jint id_) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestTerminateSession_init(APRequestTerminateSession *self);

FOUNDATION_EXPORT APRequestTerminateSession *new_APRequestTerminateSession_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestTerminateSession)

typedef APRequestTerminateSession ImActorModelApiRpcRequestTerminateSession;

#endif // _APRequestTerminateSession_H_