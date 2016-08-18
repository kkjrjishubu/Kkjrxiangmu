//
//  ViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "MoreViewController.h"
#import "MassageViewController.h"
#import "UserViewController.h"
#import "CollectionViewController.h"

#define SCALE screenWidth/375.0

@interface ViewController ()<UIAlertViewDelegate>
{
        UITextField *_textFile;
        UITextField *_textFile1;
        BOOL isDown;
        UIButton *JZbutton;
        NSString *libraryPath ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    libraryPath =  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",libraryPath);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    UIImageView*_imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"shoufuyi.png"];
    [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100*SCALE);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(150*SCALE);
        make.height.mas_equalTo(50*SCALE);
    }];
    UILabel *_Zlab =[[UILabel alloc]init];
    _Zlab.text =@"账号";
    _Zlab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_Zlab];
    
    [_Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(30*SCALE);
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(50*SCALE);
        make.height.mas_equalTo(30*SCALE);
    }];
    UIView *view1 =[[UIView alloc]init];
    view1.backgroundColor=[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-10*SCALE);
        make.top.equalTo(_Zlab.mas_bottom).offset(10*SCALE);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *_Mlab =[[UILabel alloc]init];
    _Mlab.text = @"密码";
    _Mlab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_Mlab];
    [_Mlab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(50*SCALE);
        make.height.mas_equalTo(30*SCALE);
    }];
    UIView *view2 =[[UIView alloc]init];
    view2.backgroundColor=[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-10*SCALE);
        make.top.equalTo(_Mlab.mas_bottom).offset(10*SCALE);
        make.height.mas_equalTo(1);
    }];
    _textFile = [[UITextField alloc]init];
    _textFile.placeholder = @"请输入您的手机号";
    _textFile.font = [UIFont systemFontOfSize:10];
    NSData *phoneNumber = [userDefaults objectForKey:@"Zhanghao"];
    NSString *string = [[NSString alloc]initWithData:phoneNumber encoding:NSUTF8StringEncoding];
    if (string == nil) {
        _textFile.placeholder = @"请输入您的手机号";

    }else{
        _textFile.text = string;
    }

    [self.view addSubview:_textFile];
    [_textFile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_Zlab.mas_centerY);
        make.left.equalTo(_Zlab.mas_right).offset(0*SCALE);
        make.width.mas_equalTo(200*SCALE);
    }];
    _textFile1 = [[UITextField alloc]init];
   
    _textFile1.secureTextEntry = YES;
    NSData *data = [userDefaults objectForKey:@"passWord"];
    _textFile1.placeholder = @"请输入登录密码";
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (string == nil) {
        _textFile1.placeholder = @"请输入您的手机号";
        
    }else{
        _textFile1.text = str;
    }
    _textFile1.font = [UIFont systemFontOfSize:10];
      [self.view addSubview:_textFile1];
    [_textFile1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_Mlab.mas_centerY);
        make.left.equalTo(_Mlab.mas_right).offset(0*SCALE);
        make.width.mas_equalTo(200*SCALE);
    }];
    UIButton *button =[[UIButton alloc]init];
    button.backgroundColor = qianblue;
    button.titleLabel.font =[UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.layer.cornerRadius = 10*SCALE;
    button.layer.masksToBounds = YES;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-60*SCALE);
        make.top.equalTo(view2.mas_bottom).offset(30*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
    
    JZbutton = [[UIButton alloc]init];
    [JZbutton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
    [self.view addSubview:JZbutton];
    [JZbutton addTarget:self action:@selector(JZbuttoncilick) forControlEvents:UIControlEventTouchUpInside];
    [JZbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(26*SCALE);
        make.height.mas_equalTo(26*SCALE);
        make.top.mas_equalTo(button.mas_bottom).offset(30*SCALE);

    }];
    UILabel *JZlab = [[UILabel alloc]init];
    JZlab.text = @"记住密码";
    JZlab.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:JZlab];
    JZlab.textColor = [UIColor redColor];
    [JZlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(JZbutton.mas_centerY);
        make.left.mas_equalTo(JZbutton.mas_left).offset(30*SCALE);
        make.width.mas_equalTo(110*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
}
-(void)JZbuttoncilick{
      NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (isDown == NO) {
        [JZbutton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];
        NSString *mima = _textFile1.text;
        NSString *zhanghao = _textFile.text;
        NSData *dataOen = [mima dataUsingEncoding:NSUTF8StringEncoding];
        NSData *dataTwo = [zhanghao dataUsingEncoding:NSUTF8StringEncoding];
        [userDefaults setObject:dataOen forKey:@"passWord"];
        [userDefaults setObject:dataTwo forKey:@"Zhanghao"];
        [userDefaults synchronize];
    }else{
        NSString *path =  [NSTemporaryDirectory() stringByAppendingPathComponent:@"passWord"];
        NSString *pathish = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Zhanghao"];
        NSLog(@"1111111%@",pathish);
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:path error:nil];
        [manager removeItemAtPath:pathish error:nil];
        
        [JZbutton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];

    }
    isDown =! isDown;
   
}
-(void)buttonClick{
    NSString *yongHiMing = _textFile.text;
    NSString *shuRuMiMa = _textFile1.text;
    if ([yongHiMing isEqualToString:@"111111"]&& [shuRuMiMa isEqualToString:@"123456"])
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        UITabBarController *_tabbarcontroll = [[UITabBarController alloc]init];
        //首页
        HomePageViewController*_homepageViewcontroll = [[HomePageViewController alloc]init];
        _homepageViewcontroll.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye@2x"] tag:0];
        UINavigationController *homepageNAV = [[UINavigationController alloc]initWithRootViewController:_homepageViewcontroll];
        
        //更多
        MoreViewController *_moreViewcontroll = [[MoreViewController alloc]init];
        _moreViewcontroll.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"更多" image:[UIImage imageNamed:@"gengduo1@2x"] tag:0];
        UINavigationController *moreNavConrtoll = [[UINavigationController alloc]initWithRootViewController:_moreViewcontroll];
        
        MassageViewController *_massageViewcontroll = [[MassageViewController alloc]init];
        _massageViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息中心" image:[UIImage imageNamed:@"xiaoxi@2x"] tag:0];
        
        CollectionViewController *_collectionViewcontroll = [[CollectionViewController alloc]init];
        _collectionViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"收款" image:[UIImage imageNamed:@"shoukuan@2x"] tag:0];
        UINavigationController *collectionNAV = [[UINavigationController alloc]initWithRootViewController:_collectionViewcontroll];
        
        
        
        UserViewController*_userViewcontroll = [[UserViewController alloc]init];
        _userViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户中心" image:[UIImage imageNamed:@"yonghu@2x"] tag:0];
        UINavigationController *userviewCNAV = [[UINavigationController alloc]initWithRootViewController:_userViewcontroll];
        
        
        _tabbarcontroll.viewControllers = @[homepageNAV,_massageViewcontroll,collectionNAV,userviewCNAV,moreNavConrtoll];
        
        _tabbarcontroll.tabBar.selectedImageTintColor = qianblue;
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];

        window.rootViewController = _tabbarcontroll;
        [window makeKeyWindow];
    }
    else
    {
        
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView1 show];
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
