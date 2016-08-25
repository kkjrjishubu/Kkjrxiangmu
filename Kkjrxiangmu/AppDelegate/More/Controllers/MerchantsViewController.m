//
//  MerchantsViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/24.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "MerchantsViewController.h"
#define SCALE screenWidth/375.0

@interface MerchantsViewController ()

@end

@implementation MerchantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    UIView *Bview=[[UIView alloc]init];
    Bview.backgroundColor = qianblue;
    [self.view addSubview:Bview];
    [Bview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(screenWidth);
        make.top.mas_equalTo(self.view.mas_top).offset(44);
        make.height.mas_equalTo(screenHeight/2-120*SCALE);
    }];
    
    UILabel *tradingLabel = [[UILabel alloc]init];
    tradingLabel.text = @"产生交易金额 (元)";
    tradingLabel.textColor = [UIColor whiteColor];
    tradingLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:tradingLabel];
    [tradingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(screenWidth-20*SCALE);
    }];
    UILabel *moneyLabel = [[UILabel alloc]init];
    moneyLabel.text = @"999.99999";
    moneyLabel.textColor = [UIColor whiteColor];
    moneyLabel.font =[UIFont systemFontOfSize:15];
    [self.view addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tradingLabel.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(30*SCALE);
    }];
    UILabel *numbermqmberLabel =[[UILabel alloc]init];
    [self.view addSubview:numbermqmberLabel];
    numbermqmberLabel.text = @"商户总数";
    numbermqmberLabel.textColor=[UIColor whiteColor];
    [numbermqmberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(moneyLabel.mas_bottom).offset(30*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(screenWidth-20*SCALE);
    }];
    
    UILabel *Slabel = [[UILabel alloc]init];
    Slabel.text = @"15";
    Slabel.textColor = [UIColor whiteColor];
    Slabel.font =[UIFont systemFontOfSize:15];
    [self.view addSubview:Slabel];
    [Slabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(numbermqmberLabel.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(30*SCALE);
    }];
    UIView *withView =[[UIView alloc]init];
    withView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:withView];
    [withView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Bview.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(screenHeight);
        make.height.mas_equalTo(60*SCALE);
    }];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"xiaji1.png"];
    [withView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(withView.mas_centerY);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(28*SCALE);
    }];
    UILabel *zLabel = [[UILabel alloc]init];
    zLabel.text = @"下级";
    [withView addSubview:zLabel];
    zLabel.font =[UIFont systemFontOfSize:14];
    zLabel.textColor =[UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:100];
    [zLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).offset(20*SCALE);
        make.centerY.mas_equalTo(imageView.mas_centerY);
        make.height.mas_equalTo(80*SCALE);
    }];
    
    UILabel *directlyLabel = [[UILabel alloc]init];
    directlyLabel.text = @"直接 :";
    directlyLabel.font = [UIFont systemFontOfSize:14];
    directlyLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:100];
    [withView addSubview:directlyLabel];
    [directlyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
        make.top.mas_equalTo(withView.mas_top).offset(10*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(60*SCALE);
    }];
    
    UILabel *indirectLabel = [[UILabel alloc]init];
    indirectLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:100];
    indirectLabel.text = @"间接 :";
    indirectLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:indirectLabel];
    [indirectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
        make.top.mas_equalTo(directlyLabel.mas_top).offset(20*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(60*SCALE);
        
    }];
    UILabel*direShuLabel = [[UILabel alloc]init];
    direShuLabel.text = @"11";
    direShuLabel.font = [UIFont systemFontOfSize:14];
    direShuLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:100];
    [withView addSubview:direShuLabel];
    [direShuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(directlyLabel.mas_right).offset(5*SCALE);
        make.centerY.mas_equalTo(directlyLabel.mas_centerY);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(40*SCALE);
    }];
    UILabel*indirShuLabel = [[UILabel alloc]init];
    indirShuLabel.text = @"11";
    indirShuLabel.font = [UIFont systemFontOfSize:14];
    indirShuLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:100];
    [withView addSubview:indirShuLabel];
    [indirShuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(indirectLabel.mas_right).offset(5*SCALE);
        make.centerY.mas_equalTo(indirectLabel.mas_centerY);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(40*SCALE);
    }];
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"提示：由于设置商户的隐私问题，您只能看到您的直属商户";
    promptLabel.textColor = qiangrayColor;
    promptLabel.numberOfLines = 0;
    promptLabel.font =[UIFont systemFontOfSize:13];
    [self.view addSubview:promptLabel];
    [promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
        make.top.mas_equalTo(withView.mas_bottom).offset(20*SCALE);
        make.height.mas_equalTo(80*SCALE);

    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
