//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/storage/MemoryPreferences.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/storage/MemoryPreferences.h"
#include "java/lang/Boolean.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/util/HashMap.h"

@interface AMMemoryPreferences () {
 @public
  JavaUtilHashMap *items_;
}
@end

J2OBJC_FIELD_SETTER(AMMemoryPreferences, items_, JavaUtilHashMap *)

@implementation AMMemoryPreferences

- (void)putLongWithNSString:(NSString *)key
                   withLong:(jlong)v {
  @synchronized(self) {
    (void) [((JavaUtilHashMap *) nil_chk(items_)) putWithId:key withId:JavaLangLong_valueOfWithLong_(v)];
  }
}

- (jlong)getLongWithNSString:(NSString *)key
                    withLong:(jlong)def {
  @synchronized(self) {
    if ([((JavaUtilHashMap *) nil_chk(items_)) containsKeyWithId:key]) {
      return [((JavaLangLong *) nil_chk((JavaLangLong *) check_class_cast([items_ getWithId:key], [JavaLangLong class]))) longLongValue];
    }
    return def;
  }
}

- (void)putIntWithNSString:(NSString *)key
                   withInt:(jint)v {
  (void) [((JavaUtilHashMap *) nil_chk(items_)) putWithId:key withId:JavaLangInteger_valueOfWithInt_(v)];
}

- (jint)getIntWithNSString:(NSString *)key
                   withInt:(jint)def {
  if ([((JavaUtilHashMap *) nil_chk(items_)) containsKeyWithId:key]) {
    return [((JavaLangInteger *) nil_chk((JavaLangInteger *) check_class_cast([items_ getWithId:key], [JavaLangInteger class]))) intValue];
  }
  return def;
}

- (void)putBoolWithNSString:(NSString *)key
                withBoolean:(jboolean)v {
  (void) [((JavaUtilHashMap *) nil_chk(items_)) putWithId:key withId:JavaLangBoolean_valueOfWithBoolean_(v)];
}

- (jboolean)getBoolWithNSString:(NSString *)key
                    withBoolean:(jboolean)def {
  if ([((JavaUtilHashMap *) nil_chk(items_)) containsKeyWithId:key]) {
    return [((JavaLangBoolean *) nil_chk((JavaLangBoolean *) check_class_cast([items_ getWithId:key], [JavaLangBoolean class]))) booleanValue];
  }
  return def;
}

- (void)putBytesWithNSString:(NSString *)key
               withByteArray:(IOSByteArray *)v {
  (void) [((JavaUtilHashMap *) nil_chk(items_)) putWithId:key withId:v];
}

- (IOSByteArray *)getBytesWithNSString:(NSString *)key {
  if ([((JavaUtilHashMap *) nil_chk(items_)) containsKeyWithId:key]) {
    return (IOSByteArray *) check_class_cast([items_ getWithId:key], [IOSByteArray class]);
  }
  return nil;
}

- (void)putStringWithNSString:(NSString *)key
                 withNSString:(NSString *)v {
  (void) [((JavaUtilHashMap *) nil_chk(items_)) putWithId:key withId:v];
}

- (NSString *)getStringWithNSString:(NSString *)key {
  if ([((JavaUtilHashMap *) nil_chk(items_)) containsKeyWithId:key]) {
    return (NSString *) check_class_cast([items_ getWithId:key], [NSString class]);
  }
  return nil;
}

- (instancetype)init {
  if (self = [super init]) {
    items_ = [[JavaUtilHashMap alloc] init];
  }
  return self;
}

- (void)copyAllFieldsTo:(AMMemoryPreferences *)other {
  [super copyAllFieldsTo:other];
  other->items_ = items_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMMemoryPreferences)