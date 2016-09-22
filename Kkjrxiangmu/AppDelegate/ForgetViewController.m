//
//  ForgetViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/19.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "ForgetViewController.h"
#import "AgreementViewController.h"
#define SCALE screenWidth/375.0
#define Url @"http://api.sfy.95yes.cn/ashx/user.ashx"
#import "NetWorkHelper.h"
@interface ForgetViewController ()
{
    BOOL isDown;
    UIButton *buttonyuan;
    UITextField *Textfiled;
    UITextField *Textfiled1;
    UITextField *Textfiled2;
    UITextField *Textfiled3;
}
@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    //图片3
    UIImageView *imageView4 = [[UIImageView alloc]init];
    [self.view addSubview:imageView4];
    imageView4.image = [UIImage imageNamed:@"shouji.png"];
    
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
        make.top.equalTo(imageView3.mas_top).offset(60*SCALE);
    }];

    //线条4
    UIView *Xview4 = [[UIView alloc]init];
    Xview4.backgroundColor = xianClole;
    [self.view addSubview:Xview4];
    [Xview4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView4.mas_top).offset(45*SCALE);
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
    Textfiled2.placeholder = @"请输入您的密码";
    Textfiled2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled2];
    [Textfiled2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView3.mas_centerY).offset(0);
        make.left.equalTo(imageView3.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    Textfiled3 = [[UITextField alloc]init];
    Textfiled3.placeholder = @"请输入邀请人手机号";
    Textfiled3.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Textfiled3];
    [Textfiled3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView4.mas_centerY).offset(0);
        make.left.equalTo(imageView4.mas_left).offset(40*SCALE);
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
    [Completebutton setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 10*SCALE;
    Completebutton.layer.masksToBounds = YES;
    
    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(Xview4.mas_bottom).offset(20*SCALE);
    }];
    buttonyuan = [[UIButton alloc]init];
    [self.view addSubview:buttonyuan];
    [buttonyuan setImage:[UIImage imageNamed:@"duihaoyuanhuise.png"] forState:UIControlStateNormal];
    [buttonyuan addTarget:self action:@selector(buttonyuancilick) forControlEvents:UIControlEventTouchUpInside];
    [buttonyuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Completebutton.mas_bottom).offset(20*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(30*SCALE);
        make.height.mas_equalTo(18*SCALE);
        make.width.mas_equalTo(18*SCALE);
    }];
    UILabel *labZCX = [[UILabel alloc]init];
    labZCX.text = @"注册协议";
//    labZCX.text
} 
-(void)buttonyuancilick{
    if (isDown == NO) {
        [buttonyuan setImage:[UIImage imageNamed:@"duihaoyuan.png"] forState:UIControlStateNormal];
        AgreementViewController *agree = [[AgreementViewController alloc]init];
        [self presentViewController:agree animated:YES completion:nil];
    }else{
        [buttonyuan setImage:[UIImage imageNamed:@"duihaoyuanhuise.png"] forState:UIControlStateNormal];

    }
    isDown =! isDown;
}



/*接口URL： http://api.sfy.95yes.cn/ashx/user.ashx
 
 参数说明
 
 名称	类型	说明	是否必填	示例	默认值
 action	string	register_sendsms	是
 username	string	11位手机号	是*/ // 15837072274
-(void)cilick{
    NSDictionary *dic = @{@"action":@"register_sendsms"
                          ,@"username":Textfiled.text};
    [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:dic success:^(id responseObject) {
        NSLog(@"注册验证码%@",responseObject[@"Msg"]);

    } failur:^(id error) {
        NSLog(@"失败%@",error);
    }];
    
    
    
}
-(void)completebcilick{
    /*接口URL： http://api.sfy.95yes.cn/ashx/user.ashx
     
     参数说明
     
     名称	类型	说明	是否必填	示例	默认值
     action	string	register	是	固定参数值
     username	string	注册手机号	是
     password	string	注册登录密码	是
     smscode	string	注册验证码	是		
*/
    
    NSDictionary *Zdic = @{@"action":@"register",@"username":Textfiled.text,@"password":Textfiled2.text,@"smscode":Textfiled1.text,@"recommendUserName":Textfiled3.text};
    [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:Zdic success:^(id responseObject) {
        NSLog(@"注册成功%@",responseObject[@"Msg"]);
    } failur:^(id error) {
        NSLog(@"失败%@",error);
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
