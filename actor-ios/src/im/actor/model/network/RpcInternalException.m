//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/network/RpcInternalException.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/network/RpcInternalException.h"

@implementation AMRpcInternalException

- (instancetype)init {
  return [super initWithNSString:@"INTERNAL_ERROR" withInt:500 withNSString:@"Internal server error" withBoolean:YES withByteArray:nil];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", "RpcInternalException", NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _AMRpcInternalException = { 1, "RpcInternalException", "im.actor.model.network", NULL, 0x1, 1, methods, 0, NULL, 0, NULL};
  return &_AMRpcInternalException;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMRpcInternalException)