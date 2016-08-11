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
@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_ImageArray;
    NSArray *_LabArray;
}
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UITableView *_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  SCREEN_HEIGHT/3-22,SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 40;
    
    _ImageArray=@[@[@"jiesuan.png",@"shenfen.png",@"yinhang.png"],@[@"denglu.png",@"zhifu.png"],@[@"gengxin.png",@"tuichu.png"]];
    _LabArray = @[@[@"结算记录",@"身份验证",@"银行卡验证"],@[@"修改登录密码",@"支付密码"],@[@"版本更新",@"退出登录"]];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.showsVerticalScrollIndicator =
    NO;
    // _tableView.backgroundColor = [UIColor colorWithRed:247.0/225.0 green:247.0/225.0 blue:247.0/225.0 alpha:100];
    [self.view addSubview:_tableView];
    [self xianTiao];
    
    
}
-(void)xianTiao{
    //蓝色到航条
    UIView *_Naview = [[UIView alloc]initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH,44)];
    _Naview.backgroundColor = [UIColor colorWithRed:30.0/225.0 green:185.0/225.0 blue:211.0/225.0 alpha:100];
    
    [self.view addSubview:_Naview];
    UILabel *_lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(0, 0, 40, 20);
    _lab.center=CGPointMake(_Naview.center.x, _Naview.center.y-20);
    _lab.textColor =[UIColor whiteColor];
    _lab.font = [UIFont systemFontOfSize:20];
    _lab.text = @"用户";
    _lab.textAlignment = UITextAlignmentCenter;
    
    [_Naview addSubview:_lab];
    //用户的头像
    UIImageView *_headImage = [[UIImageView alloc]init];
    _headImage.frame =CGRectMake(45,90, 50, 50);
    _headImage.image =[UIImage imageNamed:@"touxiang.png"];
    [self.view addSubview:_headImage];
    
    //用户ID
    UILabel *IDlab = [[UILabel alloc]initWithFrame:CGRectMake(130, 105, 180, 20)];
    IDlab.text = @"ID:";
    IDlab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    //IDlab.backgroundColor = [UIColor redColor];
    [self.view addSubview:IDlab];
    
    UILabel *IDlab1 = [[UILabel alloc]initWithFrame:CGRectMake(150, 105, 180, 20)];
    IDlab1.text = @"888888888888888888";
    IDlab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
   // IDlab1.backgroundColor = [UIColor redColor];
    [self.view addSubview:IDlab1];


    
    //线条
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/3-22,SCREEN_WIDTH, 2)];
    view.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view];
    
    
    //上面的两个线条
    UIView *view1= [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 160,2, 65)];
    view1.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view1];
    
    UIView *view2= [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 160,2, 65)];
    view2.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view2];
    
    //三个lab
    UILabel*lab1 =[[UILabel alloc]initWithFrame:CGRectMake(40, 170, 60, 20)];
    lab1.font =[UIFont systemFontOfSize:14];
    lab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab1.text = @"账户余额";
    lab1.textAlignment = UITextAlignmentCenter;

    [self.view addSubview:lab1];
    UILabel*lab2 =[[UILabel alloc]initWithFrame:CGRectMake(175, 170,60, 20)];
    lab2.font =[UIFont systemFontOfSize:14];
    lab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab2.text = @"分润余额";
    lab2.textAlignment = UITextAlignmentCenter;

    [self.view addSubview:lab2];
    
    UILabel*lab3 =[[UILabel alloc]initWithFrame:CGRectMake(315, 170, 60, 20)];
    lab3.font =[UIFont systemFontOfSize:14];
    lab3.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    lab3.text = @"结算余额";
    lab3.textAlignment = UITextAlignmentCenter;

    [self.view addSubview:lab3];
    
    //获取的余额
    UILabel *Ylab= [[UILabel alloc]init];
    Ylab.frame = CGRectMake(0, 0, 80, 20);
    Ylab.text = @"88.88";
    Ylab.font =[UIFont systemFontOfSize:14];
    Ylab.textAlignment = UITextAlignmentCenter;
    Ylab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    Ylab.center = CGPointMake(lab1.center.x, 205);
    [self.view addSubview:Ylab];
    
    UILabel *Ylab1= [[UILabel alloc]init];
    Ylab1.frame = CGRectMake(0, 0, 80, 20);
    Ylab1.text = @"88.88";
    Ylab1.font =[UIFont systemFontOfSize:14];
    Ylab1.textAlignment = UITextAlignmentCenter;
    Ylab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    Ylab1.center = CGPointMake(lab2.center.x,205);
    [self.view addSubview:Ylab1];
    
    UILabel *Ylab2= [[UILabel alloc]init];
    Ylab2.frame = CGRectMake(0, 0, 80, 20);
    Ylab2.text = @"88.88";
    Ylab2.font =[UIFont systemFontOfSize:14];
    Ylab2.textAlignment = UITextAlignmentCenter;
    Ylab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    Ylab2.center = CGPointMake(lab3.center.x, 205);
    [self.view addSubview:Ylab2];
    

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
