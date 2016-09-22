//
//  QrcodeView.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/14.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "QrcodeView.h"

@implementation QrcodeView


- (void)BackButBlockAction:(BackButBlock)block {
    self.backbut = block;
}

- (void)SaveButBlockAction:(SaveButBlock)block {
    self.saveBut = block;
}

- (void)ShaveBlockAction:(ShaveBlock)block {
    self.shaveBut = block;
}

- (IBAction)backBut:(id)sender {
    
    if (self.backbut) {
        self.backbut();
    }
}

- (IBAction)savebutton:(id)sender {
    if (self.saveBut) {
        self.saveBut();
    }
}

- (IBAction)shavebutton:(id)sender {
    if (self.shaveBut) {
        self.shaveBut();
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
