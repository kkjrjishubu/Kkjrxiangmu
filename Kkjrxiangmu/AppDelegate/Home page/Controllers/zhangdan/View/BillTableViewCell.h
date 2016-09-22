//
//  BillTableViewCell.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/20.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillModel.h"

@interface BillTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)getCellDataWithCreativeModels:(BillModel *)billM;





@end
