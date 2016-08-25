//
//  PaymentViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "PaymentViewController.h"
#import "ZFViewController.h"
#define SCALE screenWidth/375.0
@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付密码";
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"为了您的账号安全,修改密码前请填写原密码";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12];
    //  lab.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(screenWidth);
    }];
    //图片1
    UIImageView *imageView1 = [[UIImageView alloc]init];
    [self.view addSubview:imageView1];
    imageView1.image = [UIImage imageNamed:@"mima.png"];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(130*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
    }];
    //线条1
    UIView *Xview1 = [[UIView alloc]init];
    Xview1.backgroundColor = xianClole;
    [self.view addSubview:Xview1];
    [Xview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView1.mas_top).offset(45*SCALE);
    }];
    //图片2
    UIImageView *imageView2 = [[UIImageView alloc]init];
    [self.view addSubview:imageView2];
    imageView2.image = [UIImage imageNamed:@"mima.png"];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(imageView1.mas_centerX).offset(0);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
        make.top.equalTo(imageView1.mas_top).offset(60*SCALE);
    }];
    //线条2
    UIView *Xview2 = [[UIView alloc]init];
    Xview2.backgroundColor = xianClole;
    [self.view addSubview:Xview2];
    [Xview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView2.mas_top).offset(45*SCALE);
    }];
    //图片3
    UIImageView *imageView3 = [[UIImageView alloc]init];
    [self.view addSubview:imageView3];
    imageView3.image = [UIImage imageNamed:@"mima.png"];
    
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
        make.top.equalTo(imageView2.mas_top).offset(60*SCALE);
    }];
    //线条3
    UIView *Xview3 = [[UIView alloc]init];
    Xview3.backgroundColor = xianClole;
    [self.view addSubview:Xview3];
    [Xview3 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView3.mas_top).offset(45*SCALE);
    }];
    //输入框
    UITextField *Textfiled = [[UITextField alloc]init];
    Textfiled.placeholder = @"请输入您的原支付密码";
    Textfiled.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled];
    [Textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY).offset(0);
        make.left.equalTo(imageView1.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UITextField *Textfiled1 = [[UITextField alloc]init];
    Textfiled1.placeholder = @"请输入您的新支付密码";
    Textfiled1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled1];
    [Textfiled1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView2.mas_centerY).offset(0);
        make.left.equalTo(imageView2.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UITextField *Textfiled2 = [[UITextField alloc]init];
    Textfiled2.placeholder = @"请再次输入支付密码确认";
    Textfiled2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled2];
    [Textfiled2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView3.mas_centerY).offset(0);
        make.left.equalTo(imageView3.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UIButton *button =[[UIButton alloc]init];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Xview1.mas_bottom).offset(5*SCALE);
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(100*SCALE);
    }];
    UIButton*Completebutton = [[UIButton alloc]init];
    Completebutton.backgroundColor = qianblue;
    [Completebutton addTarget:self action:@selector(completebcilick) forControlEvents:UIControlEventTouchUpInside];
    [Completebutton setTitle:@"确认修改" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 10*SCALE;
    Completebutton.layer.masksToBounds = YES;
    
    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(Xview3.mas_bottom).offset(80*SCALE);
    }];
    
    UILabel *Mlab = [[UILabel alloc]init];
    [self.view addSubview:Mlab];
    Mlab.textColor = [UIColor grayColor];
    Mlab.text = @"忘记密码 ？";
    Mlab.font =[UIFont systemFontOfSize:12];
    [Mlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Completebutton.mas_top).offset(-20*SCALE);
        make.right.equalTo(Completebutton.mas_right).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(100*SCALE);
    }];
}
-(void)cilick{
       ZFViewController *Back = [[ZFViewController alloc]init];
       [self.navigationController pushViewController:Back animated:YES];
}
-(void)completebcilick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
