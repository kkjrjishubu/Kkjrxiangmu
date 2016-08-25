
//
//  RateTableViewCell.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "RateTableViewCell.h"

@implementation RateTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.rateview = [[[NSBundle mainBundle]loadNibNamed:@"RateView" owner:self options:nil] firstObject];
        self.rateview.frame = CGRectMake(10,10, screenWidth - 75, 35);
        
        [self.contentView addSubview:self.rateview];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
