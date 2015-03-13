//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/EncryptedDocumentV1Ex.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/EncryptedDocumentV1Ex.h"
#include "im/actor/model/api/EncryptedDocumentV1ExPhoto.h"
#include "im/actor/model/api/EncryptedDocumentV1ExUnsupported.h"
#include "im/actor/model/api/EncryptedDocumentV1VExideo.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/DataOutput.h"
#include "java/io/IOException.h"

#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation ImActorModelApiEncryptedDocumentV1Ex

+ (ImActorModelApiEncryptedDocumentV1Ex *)fromBytesWithInt:(jint)key
                                             withByteArray:(IOSByteArray *)content {
  return ImActorModelApiEncryptedDocumentV1Ex_fromBytesWithInt_withByteArray_(key, content);
}

- (IOSByteArray *)buildContainer {
  BSDataOutput *res = [[BSDataOutput alloc] init];
  BSBserWriter *writer = [[BSBserWriter alloc] initWithBSDataOutput:res];
  [writer writeIntWithInt:1 withInt:[self getHeader]];
  [writer writeBytesWithInt:2 withByteArray:[self toByteArray]];
  return [res toByteArray];
}

- (instancetype)init {
  return [super init];
}

@end

ImActorModelApiEncryptedDocumentV1Ex *ImActorModelApiEncryptedDocumentV1Ex_fromBytesWithInt_withByteArray_(jint key, IOSByteArray *content) {
  ImActorModelApiEncryptedDocumentV1Ex_init();
  switch (key) {
    case 1:
    return ((ImActorModelApiEncryptedDocumentV1ExPhoto *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiEncryptedDocumentV1ExPhoto alloc] init], content));
    case 2:
    return ((ImActorModelApiEncryptedDocumentV1VExideo *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiEncryptedDocumentV1VExideo alloc] init], content));
    default:
    return [[ImActorModelApiEncryptedDocumentV1ExUnsupported alloc] initWithInt:key withByteArray:content];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiEncryptedDocumentV1Ex)
