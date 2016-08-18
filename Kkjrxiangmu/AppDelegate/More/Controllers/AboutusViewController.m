//
//  AboutusViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/17.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AboutusViewController.h"
#define SCALE screenWidth/375.0
@interface AboutusViewController ()

@end

@implementation AboutusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    UIImageView *_imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"tubiao.png"];
    [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100*SCALE);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(100*SCALE);
        make.height.mas_equalTo(100*SCALE);
    }];
    
    UILabel*lab = [[UILabel alloc]init];
    lab.text = @"收付易集成缴费系统客户端";
    [self.view addSubview:lab];
    lab.textAlignment = UITextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:12];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(10*SCALE);
        make.centerX.mas_equalTo(_imageView.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(20*SCALE);
    }];
    UILabel *_labOne = [[UILabel alloc]init];
    _labOne.text = @"网关支付（河南）信息技术有限公司";
    [self.view addSubview:_labOne];
    _labOne.textAlignment = UITextAlignmentCenter;
    _labOne.font = [UIFont systemFontOfSize:12];
    [_labOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset(10*SCALE);
        make.centerX.mas_equalTo(_imageView.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(20*SCALE);
    }];
    UILabel *_labTwo = [[UILabel alloc]init];
    _labTwo.text = @"地址: 河南省郑州市升龙环球大厦B座22层";
    [self.view addSubview:_labTwo];
    _labTwo.textAlignment = UITextAlignmentCenter;
    _labTwo.font = [UIFont systemFontOfSize:12];
    [_labTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labOne.mas_bottom).offset(0*SCALE);
        make.centerX.mas_equalTo(_imageView.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(20*SCALE);
    }];

    UILabel *_labthree = [[UILabel alloc]init];
    _labthree.text = @"服务热线: 400-9691-669";
    [self.view addSubview:_labthree];
    _labthree.textAlignment = UITextAlignmentCenter;
    _labthree.font = [UIFont systemFontOfSize:12];
    [_labthree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labTwo.mas_bottom).offset(0*SCALE);
        make.centerX.mas_equalTo(_imageView.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(20*SCALE);
    }];
    UILabel *_labFour = [[UILabel alloc]init];
    _labFour.text = @"收付易版权";
    [self.view addSubview:_labFour];
    _labFour.textAlignment = UITextAlignmentCenter;
    _labFour.font = [UIFont systemFontOfSize:12];
    [_labFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labthree.mas_bottom).offset(10*SCALE);
        make.centerX.mas_equalTo(_imageView.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(20*SCALE);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
