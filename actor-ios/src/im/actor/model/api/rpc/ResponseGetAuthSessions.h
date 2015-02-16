//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/ResponseGetAuthSessions.java
//

#ifndef _ImActorModelApiRpcResponseGetAuthSessions_H_
#define _ImActorModelApiRpcResponseGetAuthSessions_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@protocol JavaUtilList;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Response.h"

#define ImActorModelApiRpcResponseGetAuthSessions_HEADER 81

@interface ImActorModelApiRpcResponseGetAuthSessions : ImActorModelNetworkParserResponse {
}

+ (ImActorModelApiRpcResponseGetAuthSessions *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)userAuths;

- (instancetype)init;

- (id<JavaUtilList>)getUserAuths;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcResponseGetAuthSessions)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiRpcResponseGetAuthSessions *ImActorModelApiRpcResponseGetAuthSessions_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcResponseGetAuthSessions, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcResponseGetAuthSessions)

#endif // _ImActorModelApiRpcResponseGetAuthSessions_H_