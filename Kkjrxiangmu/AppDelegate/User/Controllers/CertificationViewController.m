//
//  CertificationViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/15.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "CertificationViewController.h"
#import "Masonry.h"
#define SCALE screenWidth/375.0
@interface CertificationViewController ()

@end

@implementation CertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =backViewColor;
    self.navigationItem.title = @"实名认证";
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
   
    UILabel *Zlab = [[UILabel alloc]init];
    Zlab.text = @"身份证正面";
    Zlab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Zlab];
    [Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30*SCALE);
        make.top.equalTo(self.view.mas_top).offset(150*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    UIButton*button1 =[[UIButton alloc]init];
    button1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button1];
    button1.layer.cornerRadius = 10*SCALE;
    button1.layer.masksToBounds = YES;
    [button1 addTarget:self action:@selector(cilickone) forControlEvents:UIControlEventTouchUpInside];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Zlab.mas_centerY);
        make.left.equalTo(Zlab.mas_right).offset(30*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(70*SCALE);
    }];
    
    UIImageView *_imView = [[UIImageView alloc]init];
    _imView.image = [UIImage imageNamed:@"xiang.png"];
    [self.view addSubview:_imView];
    [_imView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button1.mas_centerX);
        make.centerY.mas_equalTo(button1.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    
    UILabel *Flab = [[UILabel alloc]init];
    Flab.text = @"身份证反面";
    Flab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Flab];
    [Flab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Zlab.mas_baseline).offset(70*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    UIButton *button2=[[UIButton alloc]init];
    button2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button2];
    button2.layer.cornerRadius = 10*SCALE;
    button2.layer.masksToBounds = YES;
    [button2 addTarget:self action:@selector(cilicktwo) forControlEvents:UIControlEventTouchUpInside];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Flab.mas_centerY);
        make.left.equalTo(Flab.mas_right).offset(30*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(70*SCALE);
    }];
    UIImageView*_imView1 = [[UIImageView alloc]init];
    _imView1.image =[UIImage imageNamed:@"xiang.png"];
    [self.view addSubview:_imView1];
    [_imView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button2.mas_centerX);
        make.centerY.mas_equalTo(button2.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    UILabel *Slab = [[UILabel alloc]init];
    Slab.text =@"手持身份证";
    Slab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Slab];
    [Slab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Flab.mas_baseline).offset(70*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    UIButton *button3=[[UIButton alloc]init];
    button3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button3];
    button3.layer.cornerRadius = 10*SCALE;
    button3.layer.masksToBounds = YES;
    [button3 addTarget:self action:@selector(cilickthree) forControlEvents:UIControlEventTouchUpInside];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Slab.mas_centerY);
        make.left.equalTo(Slab.mas_right).offset(30*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(70*SCALE);
    }];
    UIImageView*_imView2 = [[UIImageView alloc]init];
    _imView2.image =[UIImage imageNamed:@"xiang.png"];
    [self.view addSubview:_imView2];
    [_imView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button3.mas_centerX);
        make.centerY.mas_equalTo(button3.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    UIButton*Completebutton = [[UIButton alloc]init];
    Completebutton.backgroundColor = qianblue;
    [Completebutton addTarget:self action:@selector(completebcilick) forControlEvents:UIControlEventTouchUpInside];
    [Completebutton setTitle:@"完成" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 10*SCALE;
    Completebutton.layer.masksToBounds = YES;

    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(button3.mas_bottom).offset(20*SCALE);
    }];
    UILabel*Tishilab = [[UILabel alloc]init];
    Tishilab.text=@"      请确保在光线充足的环境下拍摄,如果信息显示不清晰可能会导致审核不通过,敬请谅解";
    Tishilab.numberOfLines=0;
    Tishilab.textColor = [UIColor grayColor];
    Tishilab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Tishilab];
    [Tishilab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Completebutton.mas_bottom).offset(5*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(40*SCALE);
        
    }];
}
-(void)cilickone{
    
}
-(void)cilicktwo{
    
}
-(void)cilickthree{
    
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
