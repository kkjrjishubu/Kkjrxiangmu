//
//  Alert.m
//  DreammoveAPP
//
//  Created by 壹零贰肆 壹零贰肆 on 16/5/24.
//  Copyright © 2016年 Dreammove. All rights reserved.
//

#import "Alert.h"

@implementation Alert
- (void)makeSure:(MakeSureBlock)block{
    self.makeSureBlock = block;
}
- (void)cancle:(CancleBlock)block{
    self.cancleBlock = block;
}
- (IBAction)sureAction:(id)sender {
    if (self.makeSureBlock) {
        self.makeSureBlock();
    }
}

- (IBAction)cancleAction:(id)sender {
    if (self.cancleBlock) {
        self.cancleBlock();
    }
}


@end
