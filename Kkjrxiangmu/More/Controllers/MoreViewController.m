//
//  MoreViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "MoreViewController.h"
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define View_HEIGH 125
#define View_WIDTH 175
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self oncilck];
}
-(void)oncilck{
    UIView *_navView = [[UIView alloc]initWithFrame:CGRectMake(0, 22,SCREEN_WIDTH, 44)];
    _navView.backgroundColor = [UIColor colorWithRed:30.0/225.0 green:185.0/255.0 blue:221.0/225.0 alpha:100]
    ;
    [self.view addSubview:_navView];
    UILabel *_lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(0, 0, 40, 20);
    _lab.center=CGPointMake(_navView.center.x, _navView.center.y-20);
    _lab.textColor =[UIColor whiteColor];
    _lab.font = [UIFont systemFontOfSize:20];
    _lab.text = @"用户";
    _lab.textAlignment = UITextAlignmentCenter;
    [_navView addSubview:_lab];
    
    //两个方块
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(20,86, View_WIDTH, View_HEIGH)];
    view.backgroundColor = [UIColor colorWithRed:243.0/225.0 green:197.0/225.0 blue:45.0/225.0 alpha:100];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 6.0;
    [self.view addSubview:view];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(45+View_WIDTH,86, View_WIDTH, View_HEIGH)];
    view1.backgroundColor = [UIColor colorWithRed:252.0/225.0 green:68.0/225.0 blue:130.0/225.0 alpha:100];
   // NSLog(@"%f",self.view.frame.size.width);
    [self.view addSubview:view1];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 10.0;
    UILabel *lab1=[[UILabel alloc]init];
    lab1.text = @"会员中心";
    lab1.textColor = [UIColor whiteColor];
    lab1.textAlignment = UITextAlignmentCenter;
    lab1.font=[UIFont systemFontOfSize:20];
    lab1.frame = CGRectMake(0, 20, View_WIDTH, 30);
    [view addSubview:lab1];
    UILabel *lab2=[[UILabel alloc]init];
    lab2.text = @"推广分享";
    lab2.textColor = [UIColor whiteColor];
    lab2.textAlignment = UITextAlignmentCenter;
    lab2.font=[UIFont systemFontOfSize:20];
    lab2.frame = CGRectMake(0, 20, View_WIDTH, 30);
    [view1 addSubview:lab2];
    
    UIImageView *_imageView1 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    _imageView1.image = [UIImage imageNamed:@""];
    
    
    
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
