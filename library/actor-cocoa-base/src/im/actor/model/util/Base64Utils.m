//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/util/Base64Utils.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/util/Base64Utils.java"

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/util/Base64Utils.h"
#include "java/lang/StringBuilder.h"

__attribute__((unused)) static jboolean AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(JavaLangStringBuilder *sb, jint digit, jboolean haveNonZero);

@interface AMBase64Utils () {
}

+ (jboolean)base64AppendWithJavaLangStringBuilder:(JavaLangStringBuilder *)sb
                                          withInt:(jint)digit
                                      withBoolean:(jboolean)haveNonZero;
@end

BOOL AMBase64Utils_initialized = NO;


#line 22
@implementation AMBase64Utils

IOSCharArray * AMBase64Utils_base64Chars_;
IOSByteArray * AMBase64Utils_base64Values_;


#line 61
+ (IOSByteArray *)fromBase64WithNSString:(NSString *)data {
  return AMBase64Utils_fromBase64WithNSString_(data);
}


#line 112
+ (jlong)longFromBase64WithNSString:(NSString *)value {
  return AMBase64Utils_longFromBase64WithNSString_(value);
}


#line 134
+ (NSString *)toBase64WithByteArray:(IOSByteArray *)data {
  return AMBase64Utils_toBase64WithByteArray_(data);
}


#line 176
+ (NSString *)toBase64WithLong:(jlong)value {
  return AMBase64Utils_toBase64WithLong_(value);
}


#line 198
+ (jboolean)base64AppendWithJavaLangStringBuilder:(JavaLangStringBuilder *)sb
                                          withInt:(jint)digit
                                      withBoolean:(jboolean)haveNonZero {
  return AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, digit, haveNonZero);
}

- (instancetype)init {
  return [super init];
}

+ (void)initialize {
  if (self == [AMBase64Utils class]) {
    AMBase64Utils_base64Chars_ = [IOSCharArray newArrayWithChars:(jchar[]){
#line 30
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
#line 31
      'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b',
#line 32
      'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
#line 33
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
#line 34
      '4', '5', '6', '7', '8', '9', '$', '_' } count:64];
      AMBase64Utils_base64Values_ = [IOSByteArray newArrayWithLength:
#line 42
      128];
      {
        
#line 49
        for (jint i = 0; i < AMBase64Utils_base64Chars_->size_; i++) {
          *IOSByteArray_GetRef(AMBase64Utils_base64Values_, IOSCharArray_Get(AMBase64Utils_base64Chars_, i)) = (jbyte) i;
        }
      }
      J2OBJC_SET_INITIALIZED(AMBase64Utils)
    }
  }

@end

IOSByteArray *AMBase64Utils_fromBase64WithNSString_(NSString *data) {
  AMBase64Utils_init();
  
#line 62
  if (data == nil) {
    return nil;
  }
  
#line 66
  jint len = ((jint) [((NSString *) nil_chk(data)) length]);
  NSCAssert((len % 4) == 0, @"im/actor/model/util/Base64Utils.java:67 condition failed: assert (len % 4) == 0;");
  
#line 69
  if (len == 0) {
    return [IOSByteArray newArrayWithLength:0];
  }
  
#line 73
  IOSCharArray *chars = [IOSCharArray newArrayWithLength:len];
  [data getChars:0 sourceEnd:len destination:chars destinationBegin:0];
  
#line 76
  jint olen = 3 * (len / 4);
  if (IOSCharArray_Get(chars, len - 2) == '=') {
    --olen;
  }
  if (IOSCharArray_Get(chars, len - 1) == '=') {
    --olen;
  }
  
#line 84
  IOSByteArray *bytes = [IOSByteArray newArrayWithLength:olen];
  
#line 86
  jint iidx = 0;
  jint oidx = 0;
  while (iidx < len) {
    jint c0 = IOSByteArray_Get(nil_chk(AMBase64Utils_base64Values_), IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c1 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c2 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c3 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c24 = (LShift32(c0, 18)) | (LShift32(c1, 12)) | (LShift32(c2, 6)) | c3;
    
#line 95
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) (RShift32(c24, 16));
    if (oidx == olen) {
      break;
    }
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) (RShift32(c24, 8));
    if (oidx == olen) {
      break;
    }
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) c24;
  }
  
#line 106
  return bytes;
}

jlong AMBase64Utils_longFromBase64WithNSString_(NSString *value) {
  AMBase64Utils_init();
  
#line 113
  jint pos = 0;
  jlong longVal = IOSByteArray_Get(nil_chk(AMBase64Utils_base64Values_), [((NSString *) nil_chk(value)) charAtWithInt:pos++]);
  jint len = ((jint) [value length]);
  while (pos < len) {
    LShiftAssignLong(&longVal, 6);
    longVal |= IOSByteArray_Get(AMBase64Utils_base64Values_, [value charAtWithInt:pos++]);
  }
  return longVal;
}

NSString *AMBase64Utils_toBase64WithByteArray_(IOSByteArray *data) {
  AMBase64Utils_init();
  
#line 135
  if (data == nil) {
    return nil;
  }
  
#line 139
  jint len = ((IOSByteArray *) nil_chk(data))->size_;
  if (len == 0) {
    return @"";
  }
  
#line 144
  jint olen = 4 * ((len + 2) / 3);
  IOSCharArray *chars = [IOSCharArray newArrayWithLength:olen];
  
#line 147
  jint iidx = 0;
  jint oidx = 0;
  jint charsLeft = len;
  while (charsLeft > 0) {
    jint b0 = IOSByteArray_Get(data, iidx++) & (jint) 0xff;
    jint b1 = (charsLeft > 1) ? IOSByteArray_Get(data, iidx++) & (jint) 0xff : 0;
    jint b2 = (charsLeft > 2) ? IOSByteArray_Get(data, iidx++) & (jint) 0xff : 0;
    jint b24 = (LShift32(b0, 16)) | (LShift32(b1, 8)) | b2;
    
#line 156
    jint c0 = (RShift32(b24, 18)) & (jint) 0x3f;
    jint c1 = (RShift32(b24, 12)) & (jint) 0x3f;
    jint c2 = (RShift32(b24, 6)) & (jint) 0x3f;
    jint c3 = b24 & (jint) 0x3f;
    
#line 161
    *IOSCharArray_GetRef(chars, oidx++) = IOSCharArray_Get(nil_chk(AMBase64Utils_base64Chars_), c0);
    *IOSCharArray_GetRef(chars, oidx++) = IOSCharArray_Get(AMBase64Utils_base64Chars_, c1);
    *IOSCharArray_GetRef(chars, oidx++) = (charsLeft > 1) ? IOSCharArray_Get(AMBase64Utils_base64Chars_, c2) : '=';
    *IOSCharArray_GetRef(chars, oidx++) = (charsLeft > 2) ? IOSCharArray_Get(AMBase64Utils_base64Chars_, c3) : '=';
    
#line 166
    charsLeft -= 3;
  }
  
#line 169
  return [NSString stringWithCharacters:chars];
}

NSString *AMBase64Utils_toBase64WithLong_(jlong value) {
  AMBase64Utils_init();
  
#line 178
  jint low = (jint) (value & (jint) 0xffffffff);
  jint high = (jint) (RShift64(value, 32));
  
#line 181
  JavaLangStringBuilder *sb = [[JavaLangStringBuilder alloc] init];
  jboolean haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 28)) & (jint) 0xf, NO);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 22)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 16)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 10)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 4)) & (jint) 0x3f, haveNonZero);
  jint v = (LShift32((high & (jint) 0xf), 2)) | ((RShift32(low, 30)) & (jint) 0x3);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, v, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 24)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 18)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 12)) & (jint) 0x3f, haveNonZero);
  AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 6)) & (jint) 0x3f, haveNonZero);
  AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, low & (jint) 0x3f, YES);
  
#line 195
  return [sb description];
}

jboolean AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(JavaLangStringBuilder *sb, jint digit, jboolean haveNonZero) {
  AMBase64Utils_init();
  
#line 200
  if (digit > 0) {
    haveNonZero = YES;
  }
  if (haveNonZero) {
    (void) [((JavaLangStringBuilder *) nil_chk(sb)) appendWithChar:IOSCharArray_Get(nil_chk(AMBase64Utils_base64Chars_), digit)];
  }
  return haveNonZero;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMBase64Utils)