//
//  NSMutableDictionary+Json.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "NSMutableDictionary+Json.h"

@implementation NSMutableDictionary (Json)

+ (NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonStr {
    if (jsonStr == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}









+ (NSMutableDictionary *)responseToDic:(id)data{
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return json;
}



@end

@implementation NSString (HUD)


+ (void)addMBProgressHUDImage:(NSString *)strMBP showHUDToView:(UIView *)view{
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = strMBP;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sign-inwarning"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.alpha = 0.5;
    // 1秒之后再消失
    [hud hide:YES afterDelay:2.0];
}


+ (void)addMBProgressHUD:(NSString *)strMBP showHUDToView:(UIView *)view {
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = strMBP;
    // 设置图片
    //hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sign-inwarning"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.alpha = 0.7;
    // 1秒之后再消失
    [hud hide:YES afterDelay:2.0];

}

@end





