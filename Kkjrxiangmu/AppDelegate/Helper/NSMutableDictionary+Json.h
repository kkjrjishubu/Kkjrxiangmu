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
+ (NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonStr;

// json转换
+ (NSMutableDictionary *)responseToDic:(id)data;


@end


//提示框
@interface NSString (HUD)


+ (void)addMBProgressHUDImage:(NSString *)strMBP showHUDToView:(UIView *)view;
+ (void)addMBProgressHUD:(NSString *)strMBP showHUDToView:(UIView *)view;


@end
