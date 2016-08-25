//
//  PhotoCollectionViewCell.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/22.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#define IphoeW    [UIScreen mainScreen].bounds.size.width
#import "PhotoCollectionViewCell.h"
#define SCALE screenWidth/375.0


@implementation PhotoCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setCellUI];
    }
    return self;
}

-(void)setCellUI{
    
    CGFloat imgWH = (IphoeW - 60*SCALE )/ 3;
    self.imageview = [[UIImageView alloc]init];//WithFrame:CGRectMake(0, 20, imgWH, imgWH)];
    self.imageview.userInteractionEnabled = YES;
    self.imageview.image = [UIImage imageNamed:@"photo_add@3x"];
    [self addSubview:self.imageview];
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10*SCALE);
        make.top.mas_equalTo(self.mas_top).offset(5*SCALE);
        make.height.mas_equalTo(imgWH);
        make.width.mas_equalTo(imgWH);
    }];
    
    
    self.removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.removeBtn.frame = CGRectMake(imgWH - 50*SCALE, 0, 60*SCALE, 40*SCALE);
    [self.removeBtn setImage:[UIImage imageNamed:@"delete@2x"] forState:UIControlStateNormal];
    [self.removeBtn addTarget:self action:@selector(removeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.imageview bringSubviewToFront:self.removeBtn];
    [self.imageview addSubview:self.removeBtn];
    
}

-(void)removeAction{
    [self.delegate moveImageBtnClick:self];
}



@end
