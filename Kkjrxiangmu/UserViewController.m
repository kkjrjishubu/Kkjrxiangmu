//
//  UserViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "UserViewController.h"
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
    _headImage.frame =CGRectMake(SCREEN_WIDTH/12,80, 50, 50);
    _headImage.image =[UIImage imageNamed:@"touxiang.png"];
    [self.view addSubview:_headImage];
    
    //线条
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/3-22,SCREEN_WIDTH, 2)];
    view.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view];
    
    
    
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
        return 100;
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
