//
//  modeloler.h
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/9/21.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modeloler : NSObject
//银行卡类型
@property(nonatomic,copy)NSString *CardTypeText;
//银行卡名称
@property(nonatomic,copy)NSString *BankTypeText;
//银行卡标识
@property(nonatomic,copy)NSString *CardFlagIcon;
//银行卡图标
@property(nonatomic,copy)NSString *BankIcon;
//银行卡号
@property(nonatomic,copy)NSString *BankNo;
//ID
@property(nonatomic,copy)NSString *ID;

@end
