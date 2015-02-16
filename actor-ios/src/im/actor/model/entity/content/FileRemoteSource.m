//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/content/FileRemoteSource.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/FileLocation.h"
#include "im/actor/model/entity/content/FileRemoteSource.h"
#include "java/io/IOException.h"

@interface ImActorModelEntityContentFileRemoteSource () {
 @public
  AMFileLocation *fileLocation_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(ImActorModelEntityContentFileRemoteSource, fileLocation_, AMFileLocation *)

@implementation ImActorModelEntityContentFileRemoteSource

+ (ImActorModelEntityContentFileRemoteSource *)fromValuesWithBSBserValues:(BSBserValues *)reader {
  return ImActorModelEntityContentFileRemoteSource_fromValuesWithBSBserValues_(reader);
}

- (instancetype)initWithAMFileLocation:(AMFileLocation *)fileLocation {
  if (self = [super init]) {
    self->fileLocation_ = fileLocation;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (AMFileLocation *)getFileLocation {
  return fileLocation_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  [super parseWithBSBserValues:values];
  fileLocation_ = AMFileLocation_fromBytesWithByteArray_([((BSBserValues *) nil_chk(values)) getBytesWithInt:2]);
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [super serializeWithBSBserWriter:writer];
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:2 withBSBserObject:fileLocation_];
}

- (void)copyAllFieldsTo:(ImActorModelEntityContentFileRemoteSource *)other {
  [super copyAllFieldsTo:other];
  other->fileLocation_ = fileLocation_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromValuesWithBSBserValues:", "fromValues", "Lim.actor.model.entity.content.FileRemoteSource;", 0xc, "Ljava.io.IOException;" },
    { "initWithAMFileLocation:", "FileRemoteSource", NULL, 0x1, NULL },
    { "init", "FileRemoteSource", NULL, 0x2, NULL },
    { "getFileLocation", NULL, "Lim.actor.model.entity.FileLocation;", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "fileLocation_", NULL, 0x2, "Lim.actor.model.entity.FileLocation;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelEntityContentFileRemoteSource = { 1, "FileRemoteSource", "im.actor.model.entity.content", NULL, 0x1, 6, methods, 1, fields, 0, NULL};
  return &_ImActorModelEntityContentFileRemoteSource;
}

@end

ImActorModelEntityContentFileRemoteSource *ImActorModelEntityContentFileRemoteSource_fromValuesWithBSBserValues_(BSBserValues *reader) {
  ImActorModelEntityContentFileRemoteSource_init();
  ImActorModelEntityContentFileRemoteSource *fileLocalSource = [[ImActorModelEntityContentFileRemoteSource alloc] init];
  [fileLocalSource parseWithBSBserValues:reader];
  return fileLocalSource;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelEntityContentFileRemoteSource)