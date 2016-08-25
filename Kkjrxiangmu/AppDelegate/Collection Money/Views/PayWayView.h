//
//  PayWayView.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayWayView : UIView
typedef void(^ButtonBlock)();
@property (nonatomic,copy)ButtonBlock butblock;

- (void)backbut:(ButtonBlock)block;

@end
