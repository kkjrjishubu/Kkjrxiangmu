//
//  SocialViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/19.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "SocialViewController.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYGETPAYURL];
    NSLog(@"%@",urlStr);
    //[self NetworkIntercede:urlStr];
    
    
    
}

- (void)interfaceview {
    self.navigationItem.title = @"社保缴费";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jilu@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(massageAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
    
}

- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)massageAction {
    NSLog(@"账单");
    
}

#pragma mark -- 网络请求
- (void)NetworkIntercede:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"qrCodeData":@"pay://YUj8mew3wJA/HlDC8VOQEfY5Y/xbt5amMB6dyBn5lFI6QT0zfDZo8A/qnf80bw//KbO1wvw27u/bEPZ1LVaN8DKcltbosB6bsXeKJXHOF2nnSl59oZqIP1z9xwea3AwM",
                                   @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        //DREAMAppLog(@"%@",responseObject);
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *infoDic = [NSMutableDictionary dictionaryWithJsonString:string];
        if ([infoDic[@"Success"] integerValue] == 1) {
            
            NSString *payurl = infoDic[@"PayAddress"];
            WebViewController *webviewC = [[WebViewController alloc]init];
            webviewC.weburl = payurl;
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = YES;
            webviewC.navStr = @"付款";
            
            [self.navigationController pushViewController:webviewC animated:YES];
            
        }else {
            [NSString addMBProgressHUD:infoDic[@"Msg"] showHUDToView:self.view];
        }
        
        
        DREAMAppLog(@"%@ %@",infoDic,infoDic[@"Msg"]);
        
    } failur:^(id error) {
        NSLog(@"%@",error);
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
