//
//  UserViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "UserViewController.h"
#import "Masonry.h"
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCALE SCREEN_WIDTH/375.0


@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_ImageArray;
    NSArray *_LabArray;
    UITableView *_tableView;
    
    //
    UIView *lineView;
}
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xianTiao];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  0,0, 0) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 40;
    /*UIView *view =[[UIView alloc]init];//WithFrame:CGRectMake(0, SCREEN_HEIGHT/3-22,SCREEN_WIDTH, 2)];
     view.backgroundColor = [UIColor redColor];//colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
     [self.view addSubview:view];
     [view mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(self.view.mas_left).offset(0);
     // make.width.equalTo(@(SCREEN_WIDTH));
     make.top.equalTo(self.view.mas_top).offset(screenWidth*0.53);
     // make.bottom.equalTo(@(screenHeight*0.1));//.offset(screenHeight*0.1);
     make.right.equalTo(self.view.mas_right).offset(0);
     
     make.height.equalTo(@2);
     }];*/
    [self.view addSubview:_tableView];
    _ImageArray=@[@[@"jiesuan.png",@"shenfen.png",@"yinhang.png"],@[@"denglu.png",@"zhifu.png"],@[@"gengxin.png",@"tuichu.png"]];
    _LabArray = @[@[@"结算记录",@"身份验证",@"银行卡验证"],@[@"修改登录密码",@"支付密码"],@[@"版本更新",@"退出登录"]];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.showsVerticalScrollIndicator =
    NO;
    // _tableView.backgroundColor = [UIColor colorWithRed:247.0/225.0 green:247.0/225.0 blue:247.0/225.0 alpha:100];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@(screenHeight*4.7));
        
    }];
    
    
    
    
}
-(void)xianTiao{
    //蓝色到航条
    UIView *_Naview = [[UIView alloc]init];//WithFrame:CGRectMake(0, 22, SCREEN_WIDTH,44)];
    _Naview.backgroundColor = [UIColor colorWithRed:30.0/225.0 green:185.0/225.0 blue:211.0/225.0 alpha:100];
    
    [self.view addSubview:_Naview];
    
    [_Naview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(22.0);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@44.0);
        
        
    }];
    
    
    UILabel *_lab = [[UILabel alloc]init];
    //    _lab.frame = CGRectMake(0, 0, 40, 20);
    //    _lab.center=CGPointMake(_Naview.center.x, _Naview.center.y-20);
    _lab.textColor =[UIColor whiteColor];
    _lab.font = [UIFont systemFontOfSize:20];
    _lab.text = @"用户";
    _lab.textAlignment = UITextAlignmentCenter;
    [_Naview addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_lab.superview.center.x);
        make.centerY.mas_equalTo(_lab.superview.center.y);
        make.width.mas_equalTo(40.0);
        make.height.mas_equalTo(20.0);
    }];
    
    
    //用户的头像
    UIImageView *_headImage = [[UIImageView alloc]init];
    _headImage.image =[UIImage imageNamed:@"touxiang.png"];
    [self.view addSubview:_headImage];
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_Naview.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(screenWidth*0.08);
        make.height.equalTo(@(50*SCALE));
        make.width.equalTo(@(50*SCALE));
        
    }];
    
    //用户ID
    UILabel *IDlab = [[UILabel alloc]init];
    IDlab.text = @"ID:";
    IDlab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:IDlab];
    [IDlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImage.mas_right).offset(13*SCALE);
        make.width.equalTo(@25);
        make.height.equalTo(@20);
        make.centerY.equalTo(_headImage.mas_centerY).with.offset(0);
    }];
    UILabel *IDlab1 = [[UILabel alloc]init];
    IDlab1.text = @"12345678901";
    IDlab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:IDlab1];
    [IDlab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(IDlab.mas_right).offset(2);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@20);
        make.centerY.equalTo(_headImage.mas_centerY).with.offset(0);
        
        
        
    }];
    
    
    //线条
    UIView *view =[[UIView alloc]init];
    
    lineView = view;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        
        make.top.equalTo(_headImage.mas_bottom).offset(25*SCALE+15+3+15);
        
        make.right.equalTo(self.view.mas_right).offset(0);
        
        make.height.equalTo(@2);
    }];
    
    //上面的两个线条
    UIView *view1= [[UIView alloc]init];
    view1.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview.mas_left).offset(screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@2);
        make.height.equalTo(@(33*SCALE));
    }];
    
    
    
    
    UIView *view2= [[UIView alloc]init];
    view2.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view2.superview.mas_right).offset(-screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@2);
        make.height.equalTo(@(33*SCALE));
    }];
    
    //三个lab
    UILabel*lab1 =[[UILabel alloc]init];
    lab1.font =[UIFont systemFontOfSize:14];
    lab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab1.text = @"账户余额";
    lab1.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view1.mas_right).offset(-screenWidth*0.08);
        make.top.equalTo(_headImage.mas_bottom).offset(25*SCALE);
        make.width.equalTo(@(screenWidth*0.2));
        
        make.height.equalTo(@(15));
        
        
    }];
    
    
    
    UILabel*lab2 =[[UILabel alloc]init];
    lab2.font =[UIFont systemFontOfSize:14];
    lab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab2.text = @"分润余额";
    lab2.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab1.mas_top).offset(0);
        make.width.equalTo(@(screenWidth*0.2));
        make.height.equalTo(@(15));
        make.left.equalTo(view1.mas_left).offset(screenWidth*0.06);
        
        
    }];
    
    UILabel*lab3 =[[UILabel alloc]init];
    lab3.font =[UIFont systemFontOfSize:14];
    lab3.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab3.text = @"结算余额";
    lab3.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab1.mas_top).offset(0);
        make.width.equalTo(@(screenWidth*0.2));
        make.height.equalTo(@(15));
        make.left.equalTo(view2.mas_left).offset(screenWidth*0.07);
    }];
    //获取的余额
    UILabel *Ylab= [[UILabel alloc]init];
    Ylab.text = @"88.88";
    Ylab.font =[UIFont systemFontOfSize:14];
    Ylab.textAlignment = UITextAlignmentCenter;
    Ylab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:Ylab];
    [Ylab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-screenWidth*0.8);
        make.top.equalTo(lab1.mas_bottom).offset(3);
        make.height.equalTo(@15.0);
    }];
    
    
    
    UILabel *Ylab1= [[UILabel alloc]init];
    Ylab1.text = @"88.88";
    Ylab1.font =[UIFont systemFontOfSize:14];
    Ylab1.textAlignment = UITextAlignmentCenter;
    Ylab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:Ylab1];
    [Ylab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_right).offset(-screenWidth*0.45);
        make.height.equalTo(@15);
        
        make.top.equalTo(lab1.mas_bottom).offset(3);
        
    }];
    
    
    UILabel *Ylab2= [[UILabel alloc]init];
    Ylab2.text = @"88.88";
    Ylab2.font =[UIFont systemFontOfSize:14];
    Ylab2.textAlignment = UITextAlignmentCenter;
    Ylab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:Ylab2];
    [Ylab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(view2.mas_right).offset(screenWidth*0.22);
        make.height.equalTo(@15);
        make.top.equalTo(lab1.mas_bottom).offset(3);
        
        
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }
    else if(section==1)
    {
        return 2;
    }
    else if (section==2){
        return 2;
    }
    else{
        
        return 0;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellIdentfier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentfier];
        UIView *view2 =[[UIView alloc]initWithFrame:CGRectMake(0, 39,SCREEN_WIDTH, 1)];
        view2.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
        view2.tag = 2015;
        [cell.contentView addSubview:view2];
        if (indexPath.row==0||indexPath.row==3||indexPath.row==5) {
            UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 1)];
            view1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
            [cell.contentView addSubview:view1];
        }
    }
    
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    cell.textLabel.text =[_LabArray objectAtIndex:indexPath.section][indexPath.row];
    cell.imageView.image = nil;
    cell.imageView.image = [UIImage imageNamed:[_ImageArray objectAtIndex:indexPath.section][indexPath.row]];
    
    
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section>=3) {
        return 140;
    }
    
    return 20;
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
