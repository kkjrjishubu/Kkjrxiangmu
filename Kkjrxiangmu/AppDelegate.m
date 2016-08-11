//
//  AppDelegate.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AppDelegate.h"
#import "HomepageViewController.h"
#import "MoreViewController.h"
#import "MassageViewController.h"
#import "UserViewController.h"
#import "CollectionViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *_tabbarcontroll = [[UITabBarController alloc]init];
    //首页
    HomepageViewController*_homepageViewcontroll = [[HomepageViewController alloc]init];
    _homepageViewcontroll.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:nil tag:0];
    
    //更多
    MoreViewController *_moreViewcontroll = [[MoreViewController alloc]init];
    _moreViewcontroll.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"更多" image:nil tag:0];
    
    MassageViewController *_massageViewcontroll = [[MassageViewController alloc]init];
    _massageViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息中心" image:nil tag:0];
    
    CollectionViewController *_collectionViewcontroll = [[CollectionViewController alloc]init];
    _collectionViewcontroll.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"收款" image:nil tag:0];
    
    UserViewController*_userViewcontroll = [[UserViewController alloc]init];
    _userViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户中心" image:nil tag:0];
    
    _tabbarcontroll.viewControllers = @[_homepageViewcontroll,_userViewcontroll,_massageViewcontroll,_userViewcontroll,_moreViewcontroll];
    self.window.rootViewController = _tabbarcontroll;
    [self.window makeKeyWindow];

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
