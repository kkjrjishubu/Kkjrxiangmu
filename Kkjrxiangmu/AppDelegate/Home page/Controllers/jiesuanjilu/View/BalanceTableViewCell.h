//
//  BalanceTableViewCell.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/27.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillModel.h"
#import "MessageModel.h"


@interface BalanceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *moneyLabels;
@property (weak, nonatomic) IBOutlet UILabel *wayLabels;
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabels;


- (void)getCellDataWithBillModels:(BillModel *)billM;
- (void)getCellDataWithMessageModels:(MessageModel *)messageM;



@end
