//
//  SettlementViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/23.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "SettlementViewController.h"
#define SCALE screenWidth/375.0

@interface SettlementViewController ()

@end

@implementation SettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =backViewColor;
    UIView *withView = [[UIView alloc]init];
    withView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:withView];
    [withView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left);//.offset(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right);//.offset(-30*SCALE);
        make.height.mas_equalTo(60*SCALE);
    }];
    UIView *withView1 = [[UIView alloc]init];
    withView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:withView1];
    [withView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(withView.mas_bottom).offset(15*SCALE);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(140*SCALE);
    }];
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"提现金额";
    lab.font = [UIFont systemFontOfSize:15];
    lab.textColor=[UIColor colorWithRed:171.0/255.0 green:171.0/255.0 blue:171.0/255.0 alpha:100];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.top.mas_equalTo(withView1.mas_top).offset(10*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    UILabel *moneyLab = [[UILabel alloc]init];
    moneyLab.text = @"￥";
    moneyLab.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:moneyLab];
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.top.mas_equalTo(lab.mas_top).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(40*SCALE);
    }];
    
    UITextView *textView =[[UITextView alloc]init];
    textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(moneyLab.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(lab.mas_top).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
    }];
    
    UIView *Xview = [[UIView alloc]init];
    Xview.backgroundColor =xianClole;
    [self.view addSubview:Xview];
    [Xview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(lab.mas_bottom).offset(60*SCALE);

    }];
    UIButton *chooseButton = [[UIButton alloc]init];
    [chooseButton setTitle:@"选择可结算金额" forState:UIControlStateNormal];
    chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [chooseButton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:chooseButton];
    [chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(130*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];
    
    UIButton *allButton = [[UIButton alloc]init];
    [allButton setTitle:@"全部体现" forState:UIControlStateNormal];
    allButton.titleLabel.font = [UIFont systemFontOfSize:15];
   // allButton.backgroundColor = [UIColor redColor];
    [allButton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:allButton];
    [allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
        make.width.mas_equalTo(100*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];
    UILabel *Flab =[[UILabel alloc]init];
    Flab.text = @"结算余额的范围  ：2.0-50000.0";
    [self.view addSubview:Flab];
    Flab.font = [UIFont systemFontOfSize:14];
    Flab.textColor = [UIColor grayColor];
    [Flab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(withView1.mas_bottom).offset(10*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
    }];
    
    UILabel *Slab =[[UILabel alloc]init];
    Slab.text = @"手续费 ：1.0";
    [self.view addSubview:Slab];
    Slab.font = [UIFont systemFontOfSize:14];
    Slab.textColor = [UIColor grayColor];
    [Slab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(Flab.mas_bottom).offset(0*SCALE);
        make.height.mas_equalTo(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
    }];
    UIButton *button =[[UIButton alloc]init];
    button.backgroundColor = qianblue;
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTitle: @"申请结算" forState: UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Slab.mas_bottom).offset(30*SCALE);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.height.mas_equalTo(40*SCALE);
        //make.width.mas_equalTo(200*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-40*SCALE);
        
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
