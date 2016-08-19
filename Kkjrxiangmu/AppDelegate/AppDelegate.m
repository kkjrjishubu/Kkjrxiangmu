//
//  AppDelegate.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AppDelegate.h"
//#import "HomePageViewController.h"
//#import "MoreViewController.h"
//#import "MassageViewController.h"
//#import "UserViewController.h"
//#import "CollectionViewController.h"
#import "ViewController.h"
//#define SCALE screenWidth/375.0

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vi = [[ViewController alloc]init];
      UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vi];
    
    self.window.rootViewController =nav;
    [self.window makeKeyAndVisible];

  
    //    window.rootViewController = nav;
    //    [window makeKeyWindow];
    
//    _imageView = [[UIImageView alloc]init];
//    _imageView.image = [UIImage imageNamed:@"shoufuyi.png"];
//    [self.window addSubview:_imageView];
//    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.window.mas_top).offset(100*SCALE);
//        make.centerX.equalTo(self.window.mas_centerX);
//        make.width.mas_equalTo(150*SCALE);
//        make.height.mas_equalTo(50*SCALE);
//    }];
//    _Zlab =[[UILabel alloc]init];
//    _Zlab.text =@"账号";
//    _Zlab.font = [UIFont systemFontOfSize:14];
//    [self.window addSubview:_Zlab];
//    
//    [_Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_imageView.mas_bottom).offset(30*SCALE);
//        make.left.equalTo(self.window.mas_left).offset(20*SCALE);
//        make.width.mas_equalTo(50*SCALE);
//        make.height.mas_equalTo(30*SCALE);
//    }];
//    view1 =[[UIView alloc]init];
//    view1.backgroundColor=[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
//    [self.window addSubview:view1];
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.window.mas_left).offset(10*SCALE);
//        make.right.equalTo(self.window.mas_right).offset(-10*SCALE);
//        make.top.equalTo(_Zlab.mas_bottom).offset(10*SCALE);
//        make.height.mas_equalTo(1);
//    }];
//    
//    _Mlab =[[UILabel alloc]init];
//    _Mlab.text = @"密码";
//    _Mlab.font = [UIFont systemFontOfSize:14];
//    [self.window addSubview:_Mlab];
//    [_Mlab mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.equalTo(view1.mas_bottom).offset(20*SCALE);
//        make.left.equalTo(self.window.mas_left).offset(20*SCALE);
//        make.width.mas_equalTo(50*SCALE);
//        make.height.mas_equalTo(30*SCALE);
//    }];
//    view2 =[[UIView alloc]init];
//    view2.backgroundColor=[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
//    [self.window addSubview:view2];
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.window.mas_left).offset(10*SCALE);
//        make.right.equalTo(self.window.mas_right).offset(-10*SCALE);
//        make.top.equalTo(_Mlab.mas_bottom).offset(10*SCALE);
//        make.height.mas_equalTo(1);
//    }];
//    _textFile = [[UITextField alloc]init];
//    _textFile.placeholder = @"请输入您的手机号";
//    _textFile.font = [UIFont systemFontOfSize:10];
//    [self.window addSubview:_textFile];
//    [_textFile mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_Zlab.mas_centerY);
//        make.left.equalTo(_Zlab.mas_right).offset(0*SCALE);
//        make.width.mas_equalTo(200*SCALE);
//    }];
//    _textFile1 = [[UITextField alloc]init];
//    _textFile1.placeholder = @"请输入登录密码";
//    _textFile1.font = [UIFont systemFontOfSize:10];
//    [self.window addSubview:_textFile1];
//    [_textFile1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_Mlab.mas_centerY);
//        make.left.equalTo(_Mlab.mas_right).offset(0*SCALE);
//        make.width.mas_equalTo(200*SCALE);
//    }];
//    button =[[UIButton alloc]init];
//    button.backgroundColor = qianblue;
//    button.titleLabel.font =[UIFont systemFontOfSize:12];
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"登录" forState:UIControlStateNormal];
//    [self.window addSubview:button];
//    button.layer.cornerRadius = 10*SCALE;
//    button.layer.masksToBounds = YES;
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.window.mas_left).offset(60*SCALE);
//        make.right.equalTo(self.window.mas_right).offset(-60*SCALE);
//        make.top.equalTo(view2.mas_bottom).offset(30*SCALE);
//        make.height.mas_equalTo(40*SCALE);
//    }];
//    
//    UIButton *JZbutton = [[UIButton alloc]init];
//    [JZbutton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    
//    return YES;
//}
//-(void)buttonClick{
//    NSString *yongHiMing = _textFile.text;
//    NSString *shuRuMiMa = _textFile1.text;
//    if ([yongHiMing isEqualToString:@"111111"]&& [shuRuMiMa isEqualToString:@"123456"])
//    {
//        
//        [_imageView removeFromSuperview];
//        [_Zlab  removeFromSuperview];
//        [view1 removeFromSuperview];
//        [_Mlab removeFromSuperview];
//        [view2 removeFromSuperview];
//       [_textFile removeFromSuperview];
//        [_textFile1 removeFromSuperview];
//        [button removeFromSuperview];
//
//        
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//        
//        UITabBarController *_tabbarcontroll = [[UITabBarController alloc]init];
//        //首页
//        HomePageViewController*_homepageViewcontroll = [[HomePageViewController alloc]init];
//        _homepageViewcontroll.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye@2x"] tag:0];
//        UINavigationController *homepageNAV = [[UINavigationController alloc]initWithRootViewController:_homepageViewcontroll];
//        
//        
//        //更多
//        MoreViewController *_moreViewcontroll = [[MoreViewController alloc]init];
//        _moreViewcontroll.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"更多" image:[UIImage imageNamed:@"gengduo1@2x"] tag:0];
//        UINavigationController *moreNavConrtoll = [[UINavigationController alloc]initWithRootViewController:_moreViewcontroll];
//        
//        MassageViewController *_massageViewcontroll = [[MassageViewController alloc]init];
//        _massageViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息中心" image:[UIImage imageNamed:@"xiaoxi@2x"] tag:0];
//        
//        CollectionViewController *_collectionViewcontroll = [[CollectionViewController alloc]init];
//        _collectionViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"收款" image:[UIImage imageNamed:@"shoukuan@2x"] tag:0];
//        UINavigationController *collectionNAV = [[UINavigationController alloc]initWithRootViewController:_collectionViewcontroll];
//        
//        
//        
//        UserViewController*_userViewcontroll = [[UserViewController alloc]init];
//        _userViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户中心" image:[UIImage imageNamed:@"yonghu@2x"] tag:0];
//        UINavigationController *userviewCNAV = [[UINavigationController alloc]initWithRootViewController:_userViewcontroll];
//        
//        
//        _tabbarcontroll.viewControllers = @[homepageNAV,_massageViewcontroll,collectionNAV,userviewCNAV,moreNavConrtoll];
//        
//        _tabbarcontroll.tabBar.selectedImageTintColor = qianblue;
//        self.window.rootViewController = _tabbarcontroll;
//        [self.window makeKeyWindow];
//    }
//    else
//    {
//       
//        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alertView1 show];
//
//    
//    
//    }
//
    return YES;
    }
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
