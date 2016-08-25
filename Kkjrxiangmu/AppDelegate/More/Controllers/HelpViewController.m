//
//  HelpViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/17.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "HelpViewController.h"
#define SCALE screenWidth/375.0
#import "Masonry.h"
@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:13];
    //lab.backgroundColor = [UIColor redColor];
    lab.text = @"一、收付易下载安装步骤，用手机扫描相应版本二维码 或根据分享地址点击下载 新用户点击注册 填写手机号码/设置后密码 填写注册码/设置密码上传本人身份证正反面照片 上传本人手持身份证正面照片填写结算卡并绑定储蓄卡 上传本人储蓄卡正反面照片填写完毕 提交认证审核 认证审核成功即可使用";
    lab.numberOfLines=0;
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(120*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-120*SCALE);
        make.height.mas_equalTo(230*SCALE);
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
    }];
    UILabel *lab1 = [[UILabel alloc]init];
    lab1.font = [UIFont systemFontOfSize:13];
   // lab1.backgroundColor = [UIColor blueColor];
    lab1.numberOfLines = 0;
    [self.view addSubview:lab1];
    lab1.text = @" 注1: 下载安装可以使用QQ“扫一扫”、微信“扫一扫”、支付宝“扫一扫”、US浏览器“扫一扫等等，直接扫描二维码即可安装。安卓手机扫描后请点击右上角，选择“在浏览器中打开”即可  注2: 苹果IOS9下载安装后会出现【未受信任的企业级开发者】而无法安装，请按以下步骤修正:点击设置->点击通用->点击扫描文件(或设备管理)->点击Shenyang Jie Speed Network Te chnology Co,Ltd ->点击信任->点击Shenyang Jie Speed Network Te chnology";
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-20*SCALE);
        make.height.mas_equalTo(140*SCALE);
        make.top.equalTo(lab.mas_bottom).offset(40*SCALE);
        

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
