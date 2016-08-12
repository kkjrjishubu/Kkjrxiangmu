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
    [self Inthemiddle];
    [self following];
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
    view.layer.cornerRadius = 20.0;
    [self.view addSubview:view];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(45+View_WIDTH,86, View_WIDTH, View_HEIGH)];
    view1.backgroundColor = [UIColor colorWithRed:252.0/225.0 green:68.0/225.0 blue:130.0/225.0 alpha:100];
    // NSLog(@"%f",self.view.frame.size.width);
    [self.view addSubview:view1];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 20.0;
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
    
    UIImageView *_imageView1 =[[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 40, 50)];
    
    _imageView1.image = [UIImage imageNamed:@"huiyuanzhongxin.png"];
    
    [view addSubview:_imageView1];
    
    UIImageView *_imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 40, 50)];
    
    _imageView2.image = [UIImage imageNamed:@"tuiguang.png"];
    [view1 addSubview:_imageView2];
}
-(void)Inthemiddle{
    UIView *_view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 60)];
    _view1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_view1];
    
    //线
    UIView *_xianView =[[UIView alloc]initWithFrame:CGRectMake(0, _view1.center.y, 140, 1)];
    _xianView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_xianView];
    
    UIView *_xianView1 =[[UIView alloc]initWithFrame:CGRectMake(270, _view1.center.y, 143, 1)];
    _xianView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_xianView1];
    
    //放图片的View  下级商户
    UIView *_imView = [[UIView alloc]initWithFrame:CGRectMake(15, _view1.center.y+50, 200, 150)];
    _imView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    //下级商户
    UIImageView *_MerchantsImage = [[UIImageView alloc]init];
    _MerchantsImage.image = [UIImage imageNamed:@"xiaji.png"];
    _MerchantsImage.frame = CGRectMake(0, 0, 60, 70);
    _MerchantsImage.center = CGPointMake(_imView.center.x-10, 50);
    [_imView addSubview:_MerchantsImage];
    
    UILabel *_lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(0, 0, 70, 40);
    _lab.center = CGPointMake(_imView.center.x-10, 110);
    _lab.text =@"下级商户";
    [_imView addSubview:_lab];
    
    [self.view addSubview:_imView];
    //意见反馈View
    UIView *_imView1 = [[UIView  alloc]initWithFrame:CGRectMake(230, _view1.center.y+50, 170, 70)];
    
    _imView1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_imView1];
    //意见反馈Image
    UIImageView *_OpinionView = [[UIImageView alloc]init];
    _OpinionView.frame = CGRectMake(0, 0, 40, 40);
    _OpinionView.center = CGPointMake(_imView1.center.x-40, _imView1.center.y);
    _OpinionView.image = [UIImage imageNamed:@"fankui.png"];
    [self.view addSubview:_OpinionView];
    UILabel *lab1= [[UILabel alloc]init];
    lab1.frame = CGRectMake(0, 0, 70, 40);
    lab1.center = CGPointMake(_imView1.center.x+20, _imView1.center.y);
    lab1.text = @"意见反馈";
    [self.view addSubview:lab1];
    
    //使用帮助
    UIView *_imView2 = [[UIView  alloc]initWithFrame:CGRectMake(230, _view1.center.y+130, 170, 70)];
    
    _imView2.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_imView2];
    
    UIImageView *_HelpView = [[UIImageView alloc]init];
    _HelpView.frame = CGRectMake(0, 0, 40, 40);
    _HelpView.center = CGPointMake(_imView2.center.x-40, _imView2.center.y);
    _HelpView.image = [UIImage imageNamed:@"bangzhu.png"];
    [self.view addSubview:_HelpView];
    UILabel *lab2= [[UILabel alloc]init];
    lab2.frame = CGRectMake(0, 0, 70, 40);
    lab2.center = CGPointMake(_imView2.center.x+20, _imView2.center.y);
    lab2.text = @"使用帮助";
    [self.view addSubview:lab2];
    
}
-(void)following{
    //灰色的条
    UIView *_view = [[UIView alloc]initWithFrame:CGRectMake(0, 480, SCREEN_WIDTH, 60)];
    _view.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_view];
    
    UIView *_xianView = [[UIView alloc]initWithFrame:CGRectMake(0, _view.center.y, 140, 1)];
    _xianView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_xianView];
    
    UIView *_xianView1 =[[UIView alloc]initWithFrame:CGRectMake(270, _view.center.y, 143, 1)];
    _xianView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_xianView1];
    
    //分割线
    UIView *_fenGView = [[UIView alloc]initWithFrame:CGRectMake(60, 610, SCREEN_WIDTH-60, 1)];
    _fenGView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_fenGView];
    
    UIImageView *ZhuceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 555, 30, 40)];
    
    ZhuceImageView.image = [UIImage imageNamed:@"xieyi.png"];
    
    [self.view addSubview:ZhuceImageView];
    
    UIImageView *MeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 630, 40, 40)];
    
    MeImageView.image = [UIImage imageNamed:@"guanyuwomen.png"];
    
    [self.view addSubview:MeImageView];
    
    //两个lab
    UILabel*Zlab = [[UILabel alloc]init];
    Zlab.frame = CGRectMake(0, 0, 80, 40);
    Zlab.center = CGPointMake(120, ZhuceImageView.center.y);
    Zlab.text = @"注册协议";
    [self.view addSubview:Zlab];
    
    UILabel*Zlab1 = [[UILabel alloc]init];
    Zlab1.frame = CGRectMake(0, 0, 80, 40);
    Zlab1.center = CGPointMake(120, MeImageView.center.y);
    Zlab1.text = @"关于我们";
    [self.view addSubview:Zlab1];
    
    
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
