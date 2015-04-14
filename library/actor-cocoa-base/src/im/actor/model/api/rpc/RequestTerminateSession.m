//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestTerminateSession.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestTerminateSession.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/RequestTerminateSession.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcRequestTerminateSession () {
 @public
  jint id__;
}
@end

@implementation ImActorModelApiRpcRequestTerminateSession


#line 23
+ (ImActorModelApiRpcRequestTerminateSession *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestTerminateSession_fromBytesWithByteArray_(data);
}


#line 29
- (instancetype)initWithInt:(jint)id_ {
  if (self = [super init]) {
    
#line 30
    self->id__ = id_;
  }
  return self;
}


#line 33
- (instancetype)init {
  return [super init];
}

- (jint)getId {
  
#line 38
  return self->id__;
}


#line 42
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->id__ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
}


#line 47
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 48
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:self->id__];
}

- (NSString *)description {
  NSString *res = @"rpc TerminateSession{";
  res = JreStrcat("$$", res, JreStrcat("$I", @"id=", self->id__));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 61
  return ImActorModelApiRpcRequestTerminateSession_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestTerminateSession *)other {
  [super copyAllFieldsTo:other];
  other->id__ = id__;
}

@end

ImActorModelApiRpcRequestTerminateSession *ImActorModelApiRpcRequestTerminateSession_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestTerminateSession_init();
  
#line 24
  return ((ImActorModelApiRpcRequestTerminateSession *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestTerminateSession alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestTerminateSession)