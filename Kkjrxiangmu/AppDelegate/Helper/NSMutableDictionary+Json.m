//
//  NSMutableDictionary+Json.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "NSMutableDictionary+Json.h"

@implementation NSMutableDictionary (Json)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr {
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




+ (NSDictionary *)dictionaryWithContentsOfData:(NSData *)data {
    CFPropertyListRef plist =  CFPropertyListCreateFromXMLData(kCFAllocatorDefault, (__bridge CFDataRef)data,
                                                               kCFPropertyListImmutable,
                                                               NULL);
    if(plist == nil) {
        NSLog(@"解析为空");
        return nil;
    }
    if ([(__bridge id)plist isKindOfClass:[NSDictionary class]]) {
        
        return (__bridge NSDictionary *)plist;
    }else {
        CFRelease(plist);
        NSLog(@"解析失败");

        return nil;
    }
}


+(NSDictionary*)returnDictionaryWithDataPath:(NSString*)path

{
    
    NSData* data = [[NSMutableData alloc]initWithContentsOfFile:path];
    
    NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    NSDictionary* myDictionary = [unarchiver decodeObjectForKey:@"talkData"];
    
    [unarchiver finishDecoding];
    
    //    NSLog(@"%@", myDictionary);
    
    
    
    return myDictionary;
    
}


+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
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

@implementation NSString (Adaptive)

+ (CGFloat )adaptiveWithText:(NSString *)text {
    //指定自适应过程中自适应的字体
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    //参数1 代表文字自适应的范围 2代表 文字自适应的方式前三种 3代表文字在自适应过程中自适应的字体大小
    return [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;
    
}


+ (NSString *)JSONString:(NSString *)aString {
    
    NSMutableString *s = [NSMutableString stringWithString:aString];
    
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    return [NSString stringWithString:s];
    
}




@end




