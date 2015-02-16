//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestSearchContacts.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/RequestSearchContacts.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcRequestSearchContacts () {
 @public
  NSString *request_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSearchContacts, request_, NSString *)

@implementation ImActorModelApiRpcRequestSearchContacts

+ (ImActorModelApiRpcRequestSearchContacts *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestSearchContacts_fromBytesWithByteArray_(data);
}

- (instancetype)initWithNSString:(NSString *)request {
  if (self = [super init]) {
    self->request_ = request;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (NSString *)getRequest {
  return self->request_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->request_ = [((BSBserValues *) nil_chk(values)) getStringWithInt:1];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->request_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeStringWithInt:1 withNSString:self->request_];
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcRequestSearchContacts_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestSearchContacts *)other {
  [super copyAllFieldsTo:other];
  other->request_ = request_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.rpc.RequestSearchContacts;", 0x9, "Ljava.io.IOException;" },
    { "initWithNSString:", "RequestSearchContacts", NULL, 0x1, NULL },
    { "init", "RequestSearchContacts", NULL, 0x1, NULL },
    { "getRequest", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiRpcRequestSearchContacts_HEADER },
    { "request_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
  };
  static const char *superclass_type_args[] = {"Lim.actor.model.api.rpc.ResponseSearchContacts;"};
  static const J2ObjcClassInfo _ImActorModelApiRpcRequestSearchContacts = { 1, "RequestSearchContacts", "im.actor.model.api.rpc", NULL, 0x1, 7, methods, 2, fields, 1, superclass_type_args};
  return &_ImActorModelApiRpcRequestSearchContacts;
}

@end

ImActorModelApiRpcRequestSearchContacts *ImActorModelApiRpcRequestSearchContacts_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestSearchContacts_init();
  return ((ImActorModelApiRpcRequestSearchContacts *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestSearchContacts alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestSearchContacts)