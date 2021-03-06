//
//  YhangkaViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/9/5.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "YhangkaViewController.h"
#import "Masonry.h"
#define SCALE screenWidth/375.0

@interface YhangkaViewController ()

@end

@implementation YhangkaViewController

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
    //银行卡图片
    UIImageView *YimageView = [[UIImageView alloc]init];
    YimageView.image = [UIImage imageNamed:@"yinhangrenzhengz.png"];
    [self.view addSubview:YimageView];
    [YimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lab.mas_bottom).offset(30*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.width.mas_equalTo(75*SCALE);
        make.height.mas_equalTo(48*SCALE);
        
        
    }];
    UILabel *Zlab = [[UILabel alloc]init];
    Zlab.text = @"银行卡正面";
    Zlab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:Zlab];
    [Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(YimageView.mas_centerX).offset(11.5*SCALE);
        make.top.equalTo(self.view.mas_top).offset(200*SCALE);
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
        make.bottom.equalTo(Zlab.mas_bottom);
        make.left.equalTo(Zlab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
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
    
    UIImageView *YimageView1= [[UIImageView alloc]init];
    YimageView1.image = [UIImage imageNamed:@"yinhangrenzhengb.png"];
    [self.view addSubview:YimageView1];
    [YimageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Zlab.mas_bottom).offset(30*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.width.mas_equalTo(75*SCALE);
        make.height.mas_equalTo(48*SCALE);
    }];
    UILabel *Flab = [[UILabel alloc]init];
    Flab.text = @"银行卡反面";
    Flab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Flab];
    [Flab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Zlab.mas_baseline).offset(100*SCALE);
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
        make.bottom.equalTo(Flab.mas_bottom);
        make.left.equalTo(Flab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
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
    //银行卡图片2
    UIImageView *YimageView2= [[UIImageView alloc]init];
    YimageView2.image = [UIImage imageNamed:@"shouchiyinhang.png"];
    [self.view addSubview:YimageView2];
    [YimageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Flab.mas_bottom).offset(30*SCALE);

        make.centerX.equalTo(YimageView1.mas_centerX);
        make.width.mas_equalTo(60*SCALE);
        make.height.mas_equalTo(55*SCALE);
    }];
    
    
    UILabel *Slab = [[UILabel alloc]init];
    Slab.text =@"手持银行卡";
    Slab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Slab];
    [Slab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Flab.mas_baseline).offset(100*SCALE);
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
        make.bottom.equalTo(Slab.mas_bottom);
        make.left.equalTo(Slab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
    }];
    //默认图片2
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
