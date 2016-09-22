//
//  RateModel.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/21.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RateModel : NSObject

@property (nonatomic,copy)NSString *ChannelText;// 通道名称
@property (nonatomic,copy)NSString *Rate;//费率
@property (nonatomic,copy)NSString *Amount;//结算
@property (nonatomic,copy)NSString *Quota;//额度
@property (nonatomic,copy)NSString *Settlement;//结算方式
@property (nonatomic,copy)NSString *ChannelIcon;//logo



@end
