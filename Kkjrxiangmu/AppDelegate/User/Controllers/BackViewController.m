//
//  BackViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BackViewController.h"
#define SCALE screenWidth/375.0

@interface BackViewController ()
{
    UITextField *Textfiled;
    UITextField *Textfiled1;
    UITextField *Textfiled2;
}
@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = qianblue;
    
    self.navigationItem.title = @"密码找回";
    //   self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIImageView *imageView1 = [[UIImageView alloc]init];
    [self.view addSubview:imageView1];
    imageView1.image = [UIImage imageNamed:@"shouji.png"];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(130*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(20*SCALE);
    }];
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
    imageView2.image = [UIImage imageNamed:@"duanxin.png"];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(imageView1.mas_centerX).offset(0);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(24*SCALE);
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
    Textfiled = [[UITextField alloc]init];
    Textfiled.placeholder = @"请输入您的手机号";
    Textfiled.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled];
    [Textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY).offset(0);
        make.left.equalTo(imageView1.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    Textfiled1 = [[UITextField alloc]init];
    Textfiled1.placeholder = @"请输入短信验证码";
    Textfiled1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled1];
    [Textfiled1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView2.mas_centerY).offset(0);
        make.left.equalTo(imageView2.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-120*SCALE);
    }];
    Textfiled2 = [[UITextField alloc]init];
    Textfiled2.placeholder = @"请输入您的新密码";
    Textfiled2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled2];
    [Textfiled2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView3.mas_centerY).offset(0);
        make.left.equalTo(imageView3.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UIButton *button =[[UIButton alloc]init];
    button.backgroundColor = qianblue;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10*SCALE);
        make.left.equalTo(Textfiled1.mas_right).offset(10*SCALE);
        make.bottom.equalTo(Xview2.mas_top).offset(-10*SCALE);
    }];
    UIButton*Completebutton = [[UIButton alloc]init];
    Completebutton.backgroundColor = qianblue;
    [Completebutton addTarget:self action:@selector(completebcilick) forControlEvents:UIControlEventTouchUpInside];
    [Completebutton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 10*SCALE;
    Completebutton.layer.masksToBounds = YES;
    
    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(Xview3.mas_bottom).offset(20*SCALE);
    }];
    

}
//验证码
-(void)cilick{
    /*
     名称	类型	说明	是否必填	示例	默认值
     action	string	editPassword_sendsms	是
     userName	string	11位手机号	是
     */
    NSDictionary *dic = @{@"action":@"findPassword_sendsms",@"userName":@"15837072274"};
    
   
    [[NetWorkHelper shareNetWorkEngine]PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:dic success:^(id responseObject) {
        NSLog(@"成功  %@",responseObject);
         [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
    } failur:^(id error) {
        NSLog(@"错误  %@",error);
    }];
}

//确定
-(void)completebcilick{
    /*
     
     action	string	findPassword	是
     newPassWord	string	新密码	是
     smsCode	string	短信验证码	是
     userName	string	11位手机号	否

     */
    NSDictionary *dic = @{@"action":@"findPassword",@"newPassWord":Textfiled2.text,@"smsCode":Textfiled1.text,@"userName":Textfiled.text};
    [[NetWorkHelper shareNetWorkEngine]PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:dic success:^(id responseObject) {
        [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
    } failur:^(id error) {
        NSLog(@"%@",error);
    
    }];
   
    [self dismissViewControllerAnimated:YES completion:nil];
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
