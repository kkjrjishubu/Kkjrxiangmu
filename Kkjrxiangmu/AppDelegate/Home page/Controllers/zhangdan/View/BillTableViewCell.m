//
//  BillTableViewCell.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/20.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BillTableViewCell.h"

@implementation BillTableViewCell



- (void)getCellDataWithCreativeModels:(BillModel *)billM {
    
    [self.logoImage sd_setImageWithURL:[NSURL URLWithString:billM.Icon] placeholderImage:nil];
    self.moneyLabel.text = billM.Amount;
    self.dateLabel.text = billM.ProductText;
    self.timeLabel.text = billM.Timer;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
