//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/content/ServiceGroupTitleChanged.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/content/AbsContent.h"
#include "im/actor/model/entity/content/ServiceGroupTitleChanged.h"
#include "java/io/IOException.h"

@interface ImActorModelEntityContentServiceGroupTitleChanged () {
 @public
  NSString *newTitle_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(ImActorModelEntityContentServiceGroupTitleChanged, newTitle_, NSString *)

@implementation ImActorModelEntityContentServiceGroupTitleChanged

+ (ImActorModelEntityContentServiceGroupTitleChanged *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelEntityContentServiceGroupTitleChanged_fromBytesWithByteArray_(data);
}

- (instancetype)initWithNSString:(NSString *)newTitle {
  if (self = [super initWithNSString:@"Group theme changed"]) {
    self->newTitle_ = newTitle;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (NSString *)getNewTitle {
  return newTitle_;
}

- (ImActorModelEntityContentAbsContent_ContentTypeEnum *)getContentType {
  return ImActorModelEntityContentAbsContent_ContentTypeEnum_get_SERVICE_TITLE();
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  [super parseWithBSBserValues:values];
  newTitle_ = [((BSBserValues *) nil_chk(values)) getStringWithInt:10];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [super serializeWithBSBserWriter:writer];
  [((BSBserWriter *) nil_chk(writer)) writeStringWithInt:10 withNSString:newTitle_];
}

- (void)copyAllFieldsTo:(ImActorModelEntityContentServiceGroupTitleChanged *)other {
  [super copyAllFieldsTo:other];
  other->newTitle_ = newTitle_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.entity.content.ServiceGroupTitleChanged;", 0x9, "Ljava.io.IOException;" },
    { "initWithNSString:", "ServiceGroupTitleChanged", NULL, 0x1, NULL },
    { "init", "ServiceGroupTitleChanged", NULL, 0x2, NULL },
    { "getNewTitle", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getContentType", NULL, "Lim.actor.model.entity.content.AbsContent$ContentType;", 0x4, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "newTitle_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelEntityContentServiceGroupTitleChanged = { 1, "ServiceGroupTitleChanged", "im.actor.model.entity.content", NULL, 0x1, 7, methods, 1, fields, 0, NULL};
  return &_ImActorModelEntityContentServiceGroupTitleChanged;
}

@end

ImActorModelEntityContentServiceGroupTitleChanged *ImActorModelEntityContentServiceGroupTitleChanged_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelEntityContentServiceGroupTitleChanged_init();
  return ((ImActorModelEntityContentServiceGroupTitleChanged *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelEntityContentServiceGroupTitleChanged alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelEntityContentServiceGroupTitleChanged)