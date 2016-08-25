//
//  PayWayView.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "PayWayView.h"

@implementation PayWayView


- (void)backbut:(ButtonBlock)block {
    self.butblock = block;
}

- (IBAction)backButAction:(id)sender {
    if (self.butblock) {
        self.butblock();
        
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
