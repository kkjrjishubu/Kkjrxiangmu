//
//  AgreementViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/17.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AgreementViewController.h"
#define SCALE screenWidth/375.0
@interface AgreementViewController ()

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *labone = [[UILabel alloc]init];
    labone.font = [UIFont systemFontOfSize:12];
    labone.text = @"网关支付(河南)信息技术有限公司";
    [self.view addSubview:labone];
    labone.textAlignment = UITextAlignmentCenter;
    [labone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(80*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-80*SCALE);
    }];
    UILabel *labtwo = [[UILabel alloc]init];
    labtwo.font = [UIFont systemFontOfSize:12];
    labtwo.text = @"“收付易”移动app软件用户协议";
    [self.view addSubview:labtwo];
    labtwo.textAlignment = UITextAlignmentCenter;
    [labtwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labone.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(100*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
    }];
    UILabel *labthree = [[UILabel alloc]init];
    labthree.font = [UIFont systemFontOfSize:12];
    labthree.text = @"     本协议是用户与网关支付(河南)信息技术有限公司(以下简称本公司)之间关于用户下载、安装、使用、复制、随附本协议“收               付易”软件(以下简称本软件的法律协议)";
    [self.view addSubview:labthree];
    labthree.textAlignment = UITextAlignmentCenter;
    labthree.numberOfLines = 0;
    [labthree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtwo.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
    }];
    
    UILabel *labfour = [[UILabel alloc]init];
    labfour.font = [UIFont systemFontOfSize:12];
    labfour.text = @"请务必认真阅读和理解本协议中规定的所有权利和限制。除非您接受本协议条款，否则您无权下载、安装或使用本软件以及相关的服务。您一旦安装、复制、下载、访问或以其他方式使用本软件，将视为对本协议各项条款的约束。如果您不同意本协议中的                   条款，请不要安装、复制或使用本软件";
    [self.view addSubview:labfour];
    labfour.textAlignment = UITextAlignmentCenter;
    labfour.numberOfLines = 0;
    [labfour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labthree.mas_bottom).offset(0*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
    }];
    UILabel *labfive = [[UILabel alloc]init];
    labfive.font = [UIFont systemFontOfSize:12];
    labfive.text = @"1.权利声明";
    [self.view addSubview:labfive];
    labfive.textAlignment = UITextAlignmentCenter;
    [labfive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labfour.mas_bottom).offset(5*SCALE);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
    }];
    
    UILabel *labsix = [[UILabel alloc]init];
    labsix.font = [UIFont systemFontOfSize:12];
    labsix.text = @"1.1本款软件的一切只是产权，以及与软件相关的所有信息内容，包括但不限于:文字描述及其组合、图像、图表、色彩、图标、图饰、界面设计、有关数据、附加程序、电子文档等均为本公司所有，受著作权法和国际著作权条约以及其他知识产权法律规定的               保护";
    [self.view addSubview:labsix];
    labsix.textAlignment = UITextAlignmentCenter;
    labsix.numberOfLines = 0;
    [labsix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labfive.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
    }];
    
    UILabel *labseven = [[UILabel alloc]init];
    labseven.font = [UIFont systemFontOfSize:12];
    labseven.text = @"权利限制";
    [self.view addSubview:labseven];
    labseven.textAlignment = UITextAlignmentCenter;
    labseven.numberOfLines = 0;
    [labseven mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labsix.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
    }];
    UILabel *labeight = [[UILabel alloc]init];
    labeight.font = [UIFont systemFontOfSize:12];
    labeight.text = @"2.1个别授权:如需进行商业性的销售、复制、分发、，包括不限于软件的销售、预装、捆绑等，必须得获得本公司的书面授权和许    可";
    [self.view addSubview:labeight];
    labeight.textAlignment = UITextAlignmentCenter;
    labeight.numberOfLines = 0;
    [labeight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labseven.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
    }];
    
    UILabel *labnine = [[UILabel alloc]init];
    labnine.font = [UIFont systemFontOfSize:12];
    labnine.text = @"2.1保留权利:未明示授权的和其他的权利仍归本公司所有";
    [self.view addSubview:labnine];
    labnine.textAlignment = UITextAlignmentCenter;
    labnine.numberOfLines = 0;
    [labnine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labeight.mas_bottom).offset(5*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-10*SCALE);
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
