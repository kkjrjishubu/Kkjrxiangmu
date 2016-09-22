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
#import "ForgetViewController.h"
#import "BackViewController.h"

#define SCALE screenWidth/375.0

@interface ViewController ()<UIAlertViewDelegate>
{
        UITextField *_textFile;
        UITextField *_textFile1;
        BOOL isDown;
        UIButton *JZbutton;
        NSString *libraryPath ;
    
}

@property (nonatomic,strong)NSUserDefaults *userDefaults;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = qianblue;
    
    self.navigationItem.title = @"登录";
    //   self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    libraryPath =  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",libraryPath);
    self.userDefaults = [NSUserDefaults standardUserDefaults];

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
    _textFile.font = [UIFont systemFontOfSize:12];
    NSData *phoneNumber = [_userDefaults objectForKey:@"Zhanghao"];
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
    NSData *data = [_userDefaults objectForKey:@"passWord"];
    _textFile1.placeholder = @"请输入登录密码";
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (string == nil) {
        _textFile1.placeholder = @"请输入您的手机号";
        
    }else{
        _textFile1.text = str;
    }
    _textFile1.font = [UIFont systemFontOfSize:12];
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
    BOOL bi = [[_userDefaults objectForKey:@"bool"] boolValue];
    isDown = bi;
    if (bi == NO) {
        [JZbutton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
    }else{
        [JZbutton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];

    }
    
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
    JZlab.textColor = [UIColor grayColor];
    [JZlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(JZbutton.mas_centerY);
        make.left.mas_equalTo(JZbutton.mas_left).offset(30*SCALE);
        make.width.mas_equalTo(110*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
    
    UIButton *Wjbutton = [[UIButton alloc]init];
    [Wjbutton setTitle:@"忘记密码 ？" forState:UIControlStateNormal];
    Wjbutton.titleLabel.font=[UIFont systemFontOfSize:10];
   [Wjbutton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:Wjbutton];
    [Wjbutton mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.right.mas_equalTo(self.view.mas_right).offset(10*SCALE);
        make.width.mas_equalTo(110*SCALE);
        make.height.mas_equalTo(40*SCALE);
        make.centerY.mas_equalTo(JZlab.mas_centerY);
        }];
    [Wjbutton addTarget:self action:@selector(Wjbuttoncilick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *ZHlab = [[UILabel alloc]init];
    ZHlab.text = @"还没有账户";
    ZHlab.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:ZHlab];
    ZHlab.textAlignment = UITextAlignmentCenter;
    [ZHlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(button.mas_bottom).offset(40*SCALE);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-40*SCALE);
        make.height.mas_equalTo(40*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    
    UIButton *Zbutton = [[UIButton alloc]init];
    [Zbutton setTitle:@"立即注册" forState:UIControlStateNormal];
    Zbutton.titleLabel.font = [UIFont systemFontOfSize:10];
    [Zbutton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:Zbutton];
    [Zbutton addTarget:self action:@selector(Zbuttonwithcilick) forControlEvents:UIControlEventTouchUpInside];
    [Zbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(20*SCALE);
        make.height.mas_equalTo(40*SCALE);
        make.width.mas_equalTo(80*SCALE);
        make.top.mas_equalTo(button.mas_bottom).offset(40*SCALE);
    }];
    
    
}

-(void)Wjbuttoncilick{

    BackViewController*back = [[BackViewController alloc]init];
//    [self.navigationController pushViewController:back animated:YES];
    [self presentViewController:back animated:YES completion:nil];
}
-(void)Zbuttonwithcilick{
//    NSLog(@"qqq");
       ForgetViewController *forget = [[ForgetViewController alloc]init];
    
    [self presentViewController:forget animated:YES completion:nil];
   // [self.navigationController pushViewController:forget animated:YES];

}
//注册
-(void)JZbuttoncilick{
    isDown =! isDown;
    //NO

    //YES
    if (isDown == NO) {
        [JZbutton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        [JZbutton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];
    }
    
    
    
}
//登录
-(void)buttonClick{


    /*接口URL： http://api.sfy.95yes.cn/ashx/user.ashx
     
     参数说明
     
     名称	类型	说明	是否必填	示例	默认值
     action	string	login	是	固定参数 login
     username	string	手机号	是	11位手机号
     password	string	登录密码
     */
    
    NSDictionary *Dic = @{@"action":@"login",@"username":_textFile.text,@"password":_textFile1.text};
    [[NetWorkHelper shareNetWorkEngine]PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:Dic success:^(id responseObject) {
        NSLog(@"%@",responseObject[@"Success"]);
        

       NSString* str = responseObject[@"Token"];
              NSLog(@"Token%@",str);
      
        // 存储
        [self.userDefaults setObject:str forKey:@"tokenKey"];

        [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        
         NSString *string = responseObject[@"Success"];
        int yes = [string intValue];
        if (yes == 1) {
            NSLog(@"%@",responseObject[@"Msg"]);

            NSString *mima = _textFile1.text;
            NSData *dataOen = [mima dataUsingEncoding:NSUTF8StringEncoding];
            [_userDefaults setObject:dataOen forKey:@"passWord"];
            
            NSString *zhanghao = _textFile.text;
            NSData *dataTwo = [zhanghao dataUsingEncoding:NSUTF8StringEncoding];
            [_userDefaults setObject:dataTwo forKey:@"Zhanghao"];
            [_userDefaults setObject:@(isDown) forKey:@"bool"];
            
            [_userDefaults synchronize];
            
            
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
            UINavigationController *massageViewNAV = [[UINavigationController alloc]initWithRootViewController:_massageViewcontroll];
            
            
            CollectionViewController *_collectionViewcontroll = [[CollectionViewController alloc]init];
            _collectionViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"收款" image:[UIImage imageNamed:@"shoukuan@2x"] tag:0];
            UINavigationController *collectionNAV = [[UINavigationController alloc]initWithRootViewController:_collectionViewcontroll];
            
            UserViewController*_userViewcontroll = [[UserViewController alloc]init];
            _userViewcontroll.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户中心" image:[UIImage imageNamed:@"yonghu@2x"] tag:0];
            UINavigationController *userviewCNAV = [[UINavigationController alloc]initWithRootViewController:_userViewcontroll];
            
            
            _tabbarcontroll.viewControllers = @[homepageNAV,collectionNAV,massageViewNAV,userviewCNAV,moreNavConrtoll];
            
            _tabbarcontroll.tabBar.selectedImageTintColor = qianblue;
            UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
            
            window.rootViewController = _tabbarcontroll;
            [window makeKeyWindow];
        }
        if (yes == 0) {
            UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView1 show];

        }
        
    } failur:^(id error) {
        NSLog(@"111111%@",error);
        NSString *zhanghao = _textFile.text;
        NSData *dataTwo = [zhanghao dataUsingEncoding:NSUTF8StringEncoding];
        [_userDefaults setObject:dataTwo forKey:@"Zhanghao"];
        [_userDefaults synchronize];

    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
