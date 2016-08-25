//
//  AddViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AddViewController.h"
#import "CertificationViewController.h"
#define SCALE screenWidth/375.0

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =backViewColor;
    self.navigationItem.title = @"银行卡添加";
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"互联网支付必须经过实名验证,请填写您的真实信息";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
    
    UILabel *YHKAlab = [[UILabel alloc]init];
    YHKAlab.text = @"银行卡号";
    YHKAlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:YHKAlab];
    [YHKAlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(lab.mas_bottom).offset(20*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    UIView *_xianView = [[UIView alloc]init];
    _xianView.backgroundColor = xianClole;
    [self.view addSubview:_xianView];
    [_xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(YHKAlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *SYHlab = [[UILabel alloc]init];
    SYHlab.text = @"所属银行";
    SYHlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SYHlab];
    [SYHlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(YHKAlab.mas_centerX);
        make.top.equalTo(YHKAlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    
    UILabel *SFlab = [[UILabel alloc]init];
    SFlab.text = @"银行省份";
    SFlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SFlab];
    [SFlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SYHlab.mas_centerX);
        make.top.equalTo(SYHlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];

    UIView *_xianView1 = [[UIView alloc]init];
    _xianView1.backgroundColor = xianClole;
    [self.view addSubview:_xianView1];
    [_xianView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SYHlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];

    UILabel *KHlab = [[UILabel alloc]init];
    KHlab.text = @"开户支行";
    KHlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:KHlab];
    [KHlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SYHlab.mas_centerX);
        make.top.equalTo(SFlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    
    UIView *_xianView2 = [[UIView alloc]init];
    _xianView2.backgroundColor = xianClole;
    [self.view addSubview:_xianView2];
    [_xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SFlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *SKlab = [[UILabel alloc]init];
    SKlab.text = @"收款人姓名";
    SKlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SKlab];
    [SKlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(KHlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(85*SCALE);
    }];
    
    UIView *_xianView3 = [[UIView alloc]init];
    _xianView3.backgroundColor = xianClole;
    [self.view addSubview:_xianView3];
    [_xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(KHlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *YLlab = [[UILabel alloc]init];
    YLlab.text = @"预留手机号";
    YLlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:YLlab];
    [YLlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(SKlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(85*SCALE);
    }];
    
    UIView *_xianView4 = [[UIView alloc]init];
    _xianView4.backgroundColor = xianClole;
    [self.view addSubview:_xianView4];
    [_xianView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SKlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UIView *_xianView5 = [[UIView alloc]init];
    _xianView5.backgroundColor = xianClole;
    [self.view addSubview:_xianView5];
    [_xianView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(YLlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
//TODO:输入框
    UITextField *textField1 = [[UITextField alloc]init];
    textField1.placeholder = @"请输入正确的银行卡号";
    textField1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField1];
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(YHKAlab.mas_centerY);
        make.left.equalTo(YHKAlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    UITextField *textField2 = [[UITextField alloc]init];
    textField2.placeholder = @"中国工商银行";
    textField2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField2];
    [textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SYHlab.mas_centerY);
        make.left.equalTo(SYHlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    UITextField *textField3 = [[UITextField alloc]init];
    textField3.placeholder = @"河南省 郑州市";
    textField3.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField3];
    [textField3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SFlab.mas_centerY);
        make.left.equalTo(SFlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];

    UITextField *textField4 = [[UITextField alloc]init];
    textField4.placeholder = @"如xx分行xx支行";
    textField4.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField4];
    [textField4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(KHlab.mas_centerY);
        make.left.equalTo(KHlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    

    UITextField *textField5 = [[UITextField alloc]init];
    textField5.placeholder = @"银行卡姓名";
    textField5.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField5];
    [textField5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SKlab.mas_centerY);
        make.left.equalTo(SKlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UITextField *textField6 = [[UITextField alloc]init];
    textField6.placeholder = @"银行预留手机号";
    textField6.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField6];
    [textField6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(YLlab.mas_centerY);
        make.left.equalTo(YLlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = qianblue;
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    
    [button addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_xianView5.mas_bottom).offset(30*SCALE);
        make.left.equalTo(self.view.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-60*SCALE);
        make.height.mas_equalTo(SCALE*40);
    }];
    
    
}
-(void)cilick{
//    NSArray *vcArray = [self.navigationController viewControllers];
//    UIViewController *vc = [vcArray objectAtIndex:0];
//    [self.navigationController popToViewController:vc animated:YES];
//    NSLog(@"222");
    CertificationViewController*vc = [[CertificationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
