//
//  PromptView.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/9.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptView : UIView
typedef void(^SureBlock)();

@property (nonatomic,copy)SureBlock sureblock;

- (void)sureBlock:(SureBlock)block;


@end
