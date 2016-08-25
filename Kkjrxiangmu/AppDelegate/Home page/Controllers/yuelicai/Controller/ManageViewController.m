//
//  ManageViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "ManageViewController.h"

@interface ManageViewController ()

@end

@implementation ManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    
}

- (void)interfaceview {
    self.navigationItem.title = @"余额理财";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    //[self clearNavigationBarLine];
}


- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//隐藏navigationBar下面的那条线
- (void)clearNavigationBarLine{
    //获取navigationBar上面的上面的视图
    NSArray *list = self.navigationController.navigationBar.subviews;
    for (UIView *navigationBarBackgroud in list) {
        
        //找到_UINavigationBarBackground
        if ([navigationBarBackgroud isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            //在获取_UINavigationBarBackground上面的视图
            for (UIView *lineImageView in navigationBarBackgroud.subviews) {
                
                //如果上面是imageView的话，就是那条线
                if ([lineImageView isKindOfClass:[UIImageView class]]) {
                    //将这个线隐藏
                    lineImageView.tintColor = [UIColor whiteColor];
                }
            }
        }
    }
    
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
