//
//  BillModel.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/21.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillModel : NSObject

@property (nonatomic,copy)NSString *Icon;//图标
@property (nonatomic,copy)NSString *Amount;//金额 2
@property (nonatomic,copy)NSString *ProductText;//说明
@property (nonatomic,copy)NSString *Timer;//时间 2



@property (nonatomic,copy)NSString *accountTypeText;// 提现账户类型
@property (nonatomic,copy)NSString *BankTypeText;// 到账银行
@property (nonatomic,copy)NSString *StateText;// 账单状态




@end
