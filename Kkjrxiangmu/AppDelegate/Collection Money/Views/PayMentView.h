//
//  PayMentView.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayMentView : UIView

typedef void(^SureButBlock)();
typedef void(^PaywayButBlock)();
typedef void(^ButBlock)();

@property (nonatomic,copy)SureButBlock sureBlock;
@property (nonatomic,copy)PaywayButBlock paywayBlock;
@property (nonatomic,copy)ButBlock butBlock;

- (void)sureBlockAction:(SureButBlock)block;
- (void)payWayBlockAction:(PaywayButBlock)block;
- (void)butBlock:(ButBlock)block;



@property (weak, nonatomic) IBOutlet UILabel *orderLabel;

@property (weak, nonatomic) IBOutlet UIButton *payWayBut;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;


@end
