//
//  MoreViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "MoreViewController.h"
#import "Masonry.h"
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define View_HEIGH 125
#define View_WIDTH 175
#define SCALE SCREEN_WIDTH/414.0
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self oncilck];
}
-(void)oncilck{
    
    UIView *_navView = [[UIView alloc]init];//WithFrame:CGRectMake(0, 22,SCREEN_WIDTH, 44)];
    _navView.backgroundColor = [UIColor colorWithRed:30.0/225.0 green:185.0/225.0 blue:211.0/225.0 alpha:100];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(22.0);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@44.0);
    }];
    UILabel *_lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(0, 0, 40, 20);
    _lab.center=CGPointMake(_navView.center.x, _navView.center.y-20);
    _lab.textColor =[UIColor whiteColor];
    _lab.font = [UIFont systemFontOfSize:20];
    _lab.text = @"用户";
    _lab.textAlignment = UITextAlignmentCenter;
    [_navView addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_lab.superview.center.x);
        make.centerY.mas_equalTo(_lab.superview.center.y);
        make.width.mas_equalTo(40.0);
        make.height.mas_equalTo(20.0);
    }];
    //两个方块
    UIView *view=[[UIView alloc]init];//WithFrame:CGRectMake(20,86, View_WIDTH, View_HEIGH)];
    view.backgroundColor = [UIColor colorWithRed:243.0/225.0 green:197.0/225.0 blue:45.0/225.0 alpha:100];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 20.0;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20.0*SCALE);
        make.top.equalTo(_navView.mas_bottom).offset(21.2*SCALE);
        make.height.mas_equalTo(125.0*SCALE);
        make.width.mas_equalTo(175.7*SCALE);
    }];
    UIView *view1=[[UIView alloc]init];
    view1.backgroundColor = [UIColor colorWithRed:252.0/225.0 green:68.0/225.0 blue:130.0/225.0 alpha:100];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_right).offset(25.0*SCALE);
        make.top.mas_equalTo(_navView.mas_bottom).offset(21.2*SCALE);
        make.height.mas_equalTo(125.0*SCALE);
        make.width.mas_equalTo(175.7*SCALE);

       
    }];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 20.0;
    UILabel *lab1=[[UILabel alloc]init];
    lab1.text = @"会员中心";
    lab1.textColor = [UIColor whiteColor];
    lab1.textAlignment = UITextAlignmentCenter;
    lab1.font=[UIFont systemFontOfSize:13];
    [view addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(46*SCALE);
        make.width.mas_equalTo(85*SCALE);
        make.height.mas_equalTo(22.7*SCALE);
        make.top.mas_equalTo(view.mas_top).offset(25*SCALE);
    }];
    UILabel *lab2=[[UILabel alloc]init];
    lab2.text = @"推广分享";
    lab2.textColor = [UIColor whiteColor];
    lab2.textAlignment = UITextAlignmentCenter;
    lab2.font=[UIFont systemFontOfSize:13];
    lab2.frame = CGRectMake(0, 20, View_WIDTH, 30);
    [view1 addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_left).offset(46*SCALE);
        make.width.mas_equalTo(85*SCALE);
        make.height.mas_equalTo(22.7*SCALE);
        make.top.mas_equalTo(view1.mas_top).offset(25*SCALE);
    }];

    
    UIImageView *_imageView1 =[[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 40, 50)];
    
    _imageView1.image = [UIImage imageNamed:@"huiyuanzhongxin.png"];
    
    [view addSubview:_imageView1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(70*SCALE);
        make.width.mas_equalTo(37*SCALE);
        make.height.mas_equalTo(43*SCALE);
        make.top.mas_equalTo(view.mas_top).offset(60.0*SCALE);
        
    }];

    UIImageView *_imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 40, 50)];
    
    _imageView2.image = [UIImage imageNamed:@"tuiguang.png"];
    [view1 addSubview:_imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_left).offset(70*SCALE);
        make.width.mas_equalTo(40.0*SCALE);
        make.height.mas_equalTo(42.0*SCALE);
        make.top.mas_equalTo(view1.mas_top).offset(60.0*SCALE);
        }];
    
    //灰色
    UIView *_view1 = [[UIView alloc]init];
    _view1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];    [self.view addSubview:_view1];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(60.5*SCALE);
        make.width.mas_equalTo(screenWidth);
    }];
    
    
    //线
    UIView *_xianView =[[UIView alloc]init];//WithFrame:CGRectMake(0, _view1.center.y, 140, 1)];
    _xianView.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];

    [self.view addSubview:_xianView];
    [_xianView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(_view1.mas_centerY).with.offset(0);
    make.left.equalTo(self.view.mas_left).offset(0);
    make.height.mas_equalTo(1);
    make.width.mas_equalTo(150*SCALE);
        
    }];
    
    UIView *_xianView1 =[[UIView alloc]init];
    _xianView1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_xianView1];
    [_xianView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_view1.mas_centerY).with.offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(150*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
        
    }];
    
    //放图片的View  下级商户
    UIView *_imView = [[UIView alloc]initWithFrame:CGRectMake(15, _view1.center.y+50, 200, 150)];
    _imView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_imView];
    [_imView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_view1.mas_bottom).offset(21.2*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(15.3*SCALE);
        make.width.mas_equalTo(199.5*SCALE);
        make.height.mas_equalTo(149.7*SCALE);
    }];
    //下级商户
    UIImageView *_MerchantsImage = [[UIImageView alloc]init];
    _MerchantsImage.image = [UIImage imageNamed:@"xiaji.png"];
    [_imView addSubview:_MerchantsImage];
    [_MerchantsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imView.mas_left).offset(70*SCALE);
        make.top.equalTo(_imView.mas_top).offset(SCALE*30);
        make.height.mas_equalTo(SCALE*50);
        make.width.mas_equalTo(SCALE*50);
    }];
    UILabel *_Xlab = [[UILabel alloc]init];
    _Xlab.text =@"下级商户";
    _Xlab.font = [UIFont systemFontOfSize:13];
    _Xlab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [_imView addSubview:_Xlab];
    [_Xlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imView.mas_left).offset(62.5*SCALE);
        make.top.equalTo(_imView.mas_top).offset(100*SCALE);
        make.width.mas_equalTo(80*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];

    //意见反馈View
    UIView *_imView1 = [[UIView  alloc]init];//WithFrame:CGRectMake(230, _view1.center.y+50, 170, 70)];
    
    _imView1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_imView1];
    [_imView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_view1.mas_bottom).offset(21.2*SCALE);
        make.left.mas_equalTo(_imView.mas_right).offset(16.6*SCALE);
        make.width.mas_equalTo(SCALE*170.3);
        make.height.mas_equalTo(SCALE*70.5);
    }];
    //意见反馈Image
    UIImageView *_OpinionView = [[UIImageView alloc]init];
    _OpinionView.image = [UIImage imageNamed:@"fankui.png"];
    [self.view addSubview:_OpinionView];
    [_OpinionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_imView1.mas_top).offset(15.3*SCALE);
        make.left.equalTo(_imView1.mas_left).offset(22.0*SCALE);
        make.height.mas_equalTo(31.0*SCALE);
        make.width.mas_equalTo(31.0*SCALE);
    }];
    
    
    
    UILabel *Xlab1= [[UILabel alloc]init];
    Xlab1.text = @"意见反馈";
    Xlab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    Xlab1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Xlab1];
    [Xlab1  mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(_imView1.mas_top).offset(24.6*SCALE);
        make.left.equalTo(_imView1.mas_left).offset(67.8*SCALE);
        make.height.mas_equalTo(SCALE*22);
        make.width.mas_equalTo(SCALE*73.2);
    }];
    
    
    
    
    //使用帮助
    UIView *_imView2 = [[UIView  alloc]init];//WithFrame:CGRectMake(230, _view1.center.y+130, 170, 70)];
    
    _imView2.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_imView2];
    [_imView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imView1.mas_bottom).offset(9.3*SCALE);
        make.left.mas_equalTo(_imView.mas_right).offset(16.6*SCALE);
        make.width.mas_equalTo(SCALE*170.3);
        make.height.mas_equalTo(SCALE*70.5);
    }];

    UIImageView *_HelpView = [[UIImageView alloc]init];
    _HelpView.frame = CGRectMake(0, 0, 40, 40);
    _HelpView.center = CGPointMake(_imView2.center.x-40, _imView2.center.y);
    _HelpView.image = [UIImage imageNamed:@"bangzhu.png"];
    [self.view addSubview:_HelpView];
    [_HelpView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_imView2.mas_top).offset(16.3*SCALE);
        make.left.equalTo(_imView2.mas_left).offset(22.0*SCALE);
        make.height.mas_equalTo(32.0*SCALE);
        make.width.mas_equalTo(29.0*SCALE);
    }];
    
    

    
    
    UILabel *Xlab2= [[UILabel alloc]init];
    Xlab2.font = [UIFont systemFontOfSize:13];
    Xlab2.text = @"使用帮助";
    
  Xlab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:Xlab2];
    [Xlab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imView2.mas_left).offset(62.5*SCALE);
        make.top.equalTo(_imView2.mas_top).offset(20*SCALE);
        make.width.mas_equalTo(80*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];
    
    
//下半部分灰色的条
    UIView *_viewhui = [[UIView alloc]init];
    _viewhui.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:249.0/255.0 alpha:100];
    [self.view addSubview:_viewhui];
    [_viewhui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imView.mas_bottom).offset(20*SCALE);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(60.5*SCALE);
    }];

    UIView *_XxianView = [[UIView alloc]init];
    _XxianView.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_XxianView];
    [_XxianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_viewhui.mas_centerY).with.offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(150*SCALE);
        
    }];

    
    
    UIView *_XxianView1 =[[UIView alloc]init];
    _XxianView1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_XxianView1];
    [_XxianView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_viewhui.mas_centerY).with.offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(150*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
        
    }];

    //分割线
    UIView *_fenGView = [[UIView alloc]init];
    _fenGView.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_fenGView];
    [_fenGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viewhui.mas_bottom).offset(60.2*SCALE);
        make.width.mas_equalTo(353*SCALE);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
    
    
    UIImageView *ZhuceImageView = [[UIImageView alloc]init];
    
    ZhuceImageView.image = [UIImage imageNamed:@"xieyi.png"];
    
    [self.view addSubview:ZhuceImageView];
    [ZhuceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viewhui.mas_bottom).offset(25*SCALE);
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.height.mas_equalTo(25*SCALE);
        make.width.mas_equalTo(24*SCALE);
    }];
    
    
    
    UIImageView *MeImageView = [[UIImageView alloc]init];
    MeImageView.image = [UIImage imageNamed:@"guanyuwomen.png"];
    
    [self.view addSubview:MeImageView];
    
    [MeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ZhuceImageView.mas_bottom).offset(25*SCALE);
        make.left.equalTo(self.view.mas_left).offset(20*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(24*SCALE);
    }];
    
    
    //两个lab
    UILabel*Zlab = [[UILabel alloc]init];
    Zlab.text = @"注册协议";
    Zlab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:Zlab];
    [Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viewhui.mas_bottom).offset(23.6*SCALE);
        make.left.equalTo(ZhuceImageView.mas_right).offset(26.6*SCALE);
        make.width.mas_equalTo(75.2*SCALE);
        make.height.mas_equalTo(23.2*SCALE);
    }];
    UILabel*Zlab1 = [[UILabel alloc]init];
    Zlab1.text = @"关于我们";
    Zlab1.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:Zlab1];
    [Zlab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(MeImageView.mas_right).offset(29.0*SCALE);
        make.top.equalTo(_fenGView.mas_bottom).offset(15.2*SCALE);
        make.width.mas_equalTo(75.2*SCALE);
        make.height.mas_equalTo(23.2*SCALE);
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
