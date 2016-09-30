//
//  QrcodeView.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/14.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QrcodeView : UIView
typedef void(^BackButBlock)();
typedef void(^SaveButBlock)();
typedef void(^ShaveBlock)();

@property (nonatomic,copy)BackButBlock backbut;
@property (nonatomic,copy)SaveButBlock saveBut;
@property (nonatomic,copy)ShaveBlock shaveBut;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Qrimage;

- (void)BackButBlockAction:(BackButBlock)block;
- (void)SaveButBlockAction:(SaveButBlock)block;
- (void)ShaveBlockAction:(ShaveBlock)block;


@end
