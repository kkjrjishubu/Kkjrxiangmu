//
//  BalanceTableViewCell.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/27.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BalanceTableViewCell.h"

@implementation BalanceTableViewCell


- (void)getCellDataWithBillModels:(BillModel *)billM {
    
    self.moneyLabels.text = [NSString stringWithFormat:@"-%@",billM.Amount];
    self.wayLabels.text = [NSString stringWithFormat:@"%@转账到%@",billM.accountTypeText,billM.BankTypeText];
    self.successLabel.text = billM.StateText;
    self.timeLabels.text = billM.Timer;
    
    
}


- (void)getCellDataWithMessageModels:(MessageModel *)messageM {
    self.moneyLabels.text = [NSString stringWithFormat:@"其他消息"];
    self.wayLabels.text = messageM.SendContent;
   // self.timeLabels.text = messageM.SendTime;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
