//
//  BankcardViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BankcardViewController.h"
#define SCALE screenWidth/375.0
#import "AddViewController.h"
@interface BankcardViewController ()

@end

@implementation BankcardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = backViewColor;
    self.navigationItem.title = @"银行卡管理";
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(100*SCALE);
        make.top.equalTo(self.view.mas_top).offset(100*SCALE);
    }];
    button.layer.cornerRadius = 10*SCALE;
    button.layer.masksToBounds = YES;
    UILabel *lab =[[UILabel alloc]init];
    lab.textColor = qiangrayColor;
    lab.font = [UIFont systemFontOfSize:13];
    lab.text = @"账户还未绑定银行卡";
    lab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button.mas_centerX);
        make.centerY.equalTo(button.mas_centerY);
        make.height.mas_equalTo(SCALE*30);
        make.width.mas_equalTo(button.mas_width);
    }];
    UIButton*button1 = [[UIButton alloc]init];
    button1.backgroundColor = qianblue;
    button1.layer.cornerRadius = 10*SCALE;
    button1.layer.masksToBounds = YES;
    button1.titleLabel.font = [UIFont systemFontOfSize:13];
    [button1 setTitle:@"添加银行卡" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-60*SCALE);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
    [button1 addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cilick{
    AddViewController*addview = [[AddViewController alloc]init];
    [self.navigationController pushViewController:addview animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
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
