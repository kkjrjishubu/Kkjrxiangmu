//
//  KeyboardvView.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/12.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NumberbutBlock)();
typedef void(^DonebutBlock)();
typedef void(^ZerobutBlock)();
typedef void(^SurebutBlock)();
typedef void(^CancelbutBlcok)();


@interface KeyboardvView : UIView

@property (nonatomic,strong)UILabel *labelText;
@property (nonatomic,strong)UIView *keyBorder;
@property (nonatomic,strong)UIButton *numberButton;


@property (nonatomic,copy)NumberbutBlock numberBlock;
@property (nonatomic,copy)DonebutBlock doneBlock;
@property (nonatomic,copy)ZerobutBlock zeroBlock;
@property (nonatomic,copy)SurebutBlock sureBlock;
@property (nonatomic,copy)CancelbutBlcok cancelBlock;

- (void)numberbut:(NumberbutBlock)block;
- (void)donebut:(DonebutBlock)block;
- (void)zerobut:(ZerobutBlock)block;
- (void)surebut:(SurebutBlock)block;
- (void)cancelbut:(CancelbutBlcok)block;







@end
