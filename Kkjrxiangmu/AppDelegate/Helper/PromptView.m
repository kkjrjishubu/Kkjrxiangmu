//
//  PromptView.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/9.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "PromptView.h"

@implementation PromptView

- (void)sureBlock:(SureBlock)block {
    self.sureblock = block;
}

- (IBAction)sureAction:(id)sender {
    if (self.sureblock) {
        self.sureblock();
        DREAMAppLog(@"确定block");
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
