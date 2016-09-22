//
//  IdentityViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/15.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "IdentityViewController.h"
#import "Masonry.h"
#define SCALE screenWidth/375.0
#import "CertificationViewController.h"
@interface IdentityViewController ()
{
    UITextField *Textfiled1;
    UITextField *Textfiled;
}
@end

@implementation IdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"实名认证";
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"互联网支付必须经过实名验证,请填写您的真实信息";
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
    
    UILabel *Zlab = [[UILabel alloc]init];
    //Zlab.textColor = [UIColor redColor];
    Zlab.text = @"姓名";
    Zlab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Zlab];
    [Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(130*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(40*SCALE);
    }];
    UILabel*Xlab = [[UILabel alloc]init];
    Xlab.text = @"身份证";
   // Xlab.textColor = [UIColor redColor];
    Xlab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Xlab];
    [Xlab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(Zlab.mas_centerX).offset(0);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(50*SCALE);
        make.top.equalTo(Zlab.mas_top).offset(60*SCALE);
    }];
    
    //两条线
    UIView *Xview1 = [[UIView alloc]init];
    Xview1.backgroundColor = xianClole;
    [self.view addSubview:Xview1];
    [Xview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(Zlab.mas_top).offset(45*SCALE);
    }];
    UIView *Xview2 = [[UIView alloc]init];
    Xview2.backgroundColor = xianClole;
    [self.view addSubview:Xview2];
    [Xview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(Xlab.mas_top).offset(45*SCALE);
    }];
    
    //输入框
    Textfiled = [[UITextField alloc]init];
    Textfiled.placeholder = @"请输入姓名";
    Textfiled.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Textfiled];
    [Textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Zlab.mas_centerY).offset(0);
        make.left.equalTo(Xlab.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    Textfiled1 = [[UITextField alloc]init];
    Textfiled1.placeholder = @"请输入账号";
    Textfiled1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Textfiled1];
    [Textfiled1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Xlab.mas_centerY).offset(0);
        make.left.equalTo(Xlab.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];

    UIButton *button =[[UIButton alloc]init];
    button.backgroundColor = qianblue;
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTitle: @"下一步" forState: UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Xview2.mas_bottom).offset(50*SCALE);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.height.mas_equalTo(40*SCALE);
        //make.width.mas_equalTo(200*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-40*SCALE);

    }];
    [button addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)cilick{
    CertificationViewController*CertificationView = [[CertificationViewController alloc]init];
    CertificationView.stringNmae = Textfiled.text;
    CertificationView.stringPhoen = Textfiled1.text;
    [self.navigationController pushViewController:CertificationView animated:YES];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [Textfiled1 resignFirstResponder];
    [Textfiled resignFirstResponder];
}

//-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = NO;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
