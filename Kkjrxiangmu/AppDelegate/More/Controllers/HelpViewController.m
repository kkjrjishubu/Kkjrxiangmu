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
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    lab.font = [UIFont systemFontOfSize:12];
    lab.text = @"一、收付易下载安装步骤，用手机扫描相应版本二维码 或根据分享地址点击下载 新用户点击注册 填写手机号码/设置后密码 填写注册码/设置密码上传本人身份证正反面照片 上传本人手持身份证正面照片填写结算卡并绑定储蓄卡 上传本人储蓄卡正反面照片填写完毕 提交认证审核 认证审核成功即可使用";
    lab.numberOfLines=0;
    [self.view addSubview:lab];



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
