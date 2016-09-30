//
//  NSMutableDictionary+Json.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Json)

// 字符串转换为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr;

// json转换
+ (NSMutableDictionary *)responseToDic:(id)data;


+ (NSDictionary *)dictionaryWithContentsOfData:(NSData *)data;

+(NSDictionary*)returnDictionaryWithDataPath:(NSString*)path;


+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;


@end


//提示框
@interface NSString (HUD)


+ (void)addMBProgressHUDImage:(NSString *)strMBP showHUDToView:(UIView *)view;
+ (void)addMBProgressHUD:(NSString *)strMBP showHUDToView:(UIView *)view;



@end


@interface NSString (Adaptive)

// json转字符串
+ (NSString *)JSONString:(NSString *)aString;

//文字自适应
+ (CGFloat )adaptiveWithText:(NSString *)text;


@end

