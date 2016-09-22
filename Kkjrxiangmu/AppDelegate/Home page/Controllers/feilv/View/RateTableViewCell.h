//
//  RateTableViewCell.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"
#import "RateModel.h"

@interface RateTableViewCell : UITableViewCell

@property (nonatomic,strong)RateView *rateview;

- (void)getCellDataWithCreativeModel:(RateModel *)rateM;


@end
