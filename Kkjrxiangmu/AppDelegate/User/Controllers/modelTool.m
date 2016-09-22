//
//  modelTool.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/9/7.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "modelTool.h"

@implementation modelTool
-(NSString *)getBankValue:(NSArray *)dataArray bankString:(NSString *)string{
    
    NSString *bankValue = nil;
    
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dic = dataArray[i];
        if ([dic[@"Key"] isEqualToString:string]) {
            bankValue = dic[@"Value"];
            break;
        }
    }
    NSLog(@"cccccccccc%@",bankValue);
    return bankValue;
}
-(NSString *)getBAnkeVacer:(NSArray *)dataArray bankSing:(NSString *)string{
    NSString *banKvalue = nil ;
    
    for (int a =0; a <dataArray.count;a++ ) {
        
        NSDictionary *dic = dataArray[a];
        
        if ([dic[@"CityName"] isEqualToString:string]) {
            
            banKvalue = dic[@"CityPostCode"];
            
            break;
        }
    }
    
    return banKvalue;
}
@end
