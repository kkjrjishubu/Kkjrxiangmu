//
//  PayMentView.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "PayMentView.h"

@implementation PayMentView

- (void)sureBlockAction:(SureButBlock)block {
    self.sureBlock = block;
    
}

- (IBAction)surePayAction:(id)sender {
    if (self.sureBlock) {
        self.sureBlock();
    }
}


- (void)payWayBlockAction:(PaywayButBlock)block {
    self.paywayBlock = block;
}

- (IBAction)payWayAction:(id)sender {
    if (self.paywayBlock) {
        self.paywayBlock();
        
    }
}


- (void)butBlock:(ButBlock)block {
    self.butBlock = block;
}

- (IBAction)blockAction:(id)sender {
    if (self.butBlock) {
        self.butBlock();
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
