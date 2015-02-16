//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/FileLocation.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/FileLocation.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiFileLocation () {
 @public
  jlong fileId_;
  jlong accessHash_;
}
@end

@implementation ImActorModelApiFileLocation

- (instancetype)initWithLong:(jlong)fileId
                    withLong:(jlong)accessHash {
  if (self = [super init]) {
    self->fileId_ = fileId;
    self->accessHash_ = accessHash;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jlong)getFileId {
  return self->fileId_;
}

- (jlong)getAccessHash {
  return self->accessHash_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->fileId_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  self->accessHash_ = [values getLongWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:self->fileId_];
  [writer writeLongWithInt:2 withLong:self->accessHash_];
}

- (void)copyAllFieldsTo:(ImActorModelApiFileLocation *)other {
  [super copyAllFieldsTo:other];
  other->fileId_ = fileId_;
  other->accessHash_ = accessHash_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithLong:withLong:", "FileLocation", NULL, 0x1, NULL },
    { "init", "FileLocation", NULL, 0x1, NULL },
    { "getFileId", NULL, "J", 0x1, NULL },
    { "getAccessHash", NULL, "J", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "fileId_", NULL, 0x2, "J", NULL,  },
    { "accessHash_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiFileLocation = { 1, "FileLocation", "im.actor.model.api", NULL, 0x1, 6, methods, 2, fields, 0, NULL};
  return &_ImActorModelApiFileLocation;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiFileLocation)