
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


- (void)getCellDataWithCreativeModel:(RateModel *)rateM {
    
    [self.rateview.logoImage sd_setImageWithURL:[NSURL URLWithString:rateM.ChannelIcon] placeholderImage:nil];
    self.rateview.wayLabel.text = [NSString stringWithFormat:@"       %@",rateM.Settlement];
    self.rateview.rateLabel.text = rateM.Rate;
    self.rateview.settlementLabel.text = rateM.Amount;
    self.rateview.moneyLabel.text = rateM.Quota;
    self.rateview.titleLabel.text = rateM.ChannelText;
    
    
}


- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
