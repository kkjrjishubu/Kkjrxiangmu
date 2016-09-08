//
//  UserViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//


#import "UserViewController.h"
#import "Masonry.h"
#import  "IdentityViewController.h"
#import "BankcardViewController.h"
#import "PayPasswordViewController.h"
#import "PaymentViewController.h"
#import "ViewController.h"
#import "SettlementViewController.h"
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

@property (nonatomic,strong)UILabel *IDlab1;
@property (nonatomic,strong)UILabel *Ylab;
@property (nonatomic,strong)UILabel *Ylab1;
@property (nonatomic,strong)UILabel *Ylab2;


@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xianTiao];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  0,0, 0) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 45*SCALE;
    [self.view addSubview:_tableView];
    
    self.navigationController.navigationBar.barTintColor = qianblue;
    
    self.navigationItem.title = @"用户";
 //   self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
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
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    NSLog(@"%@",urlStr);
    [self NetworkIntercede:urlStr];
    
}

/*
{
    "AccountProfit": 230, 分润余额
    "AccountPic": "http://api.sfy.95yes.cn/ashx/user.ashx/upload/pic/120256.png", 头像
    "IsAuthentication": false, 是否认证过身份
    "UserName": "18137958686", 用户名
    "IsSetPayPassword": true, 是否设置了支付密码
    "Token": "6512bd43d9caa6e02c990b0a82652dca",
    "Success": true,
    "AccountAvailable": 1523, 余额
    "AccountIn": 160, 结算金额
    "AuthenticationState": "未认证" 认证状态文本显示
}
 
*/
#pragma mark -- 网络请求
- (void)NetworkIntercede:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"getUserInfo",
                          @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *infoDic = [NSMutableDictionary dictionaryWithJsonString:string];
        
        DREAMAppLog(@"%@",infoDic);
        
        _IDlab1.text = [NSString stringWithFormat:@"%@",infoDic[@"UserName"]];
        _Ylab.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountAvailable"]];
        _Ylab1.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountProfit"]];
        _Ylab2.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountIn"]];

    } failur:^(id error) {
        NSLog(@"%@",error);
    }];
    
    
}







-(void)xianTiao{
    //蓝色到航条
    UIView *_Naview = [[UIView alloc]init];
    [self.view addSubview:_Naview];
    
    [_Naview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(22.0);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@43.0);
        
        
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
    _IDlab1 = [[UILabel alloc]init];
    
    _IDlab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_IDlab1];
    [_IDlab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(IDlab.mas_right).offset(2);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@20);
        make.centerY.equalTo(_headImage.mas_centerY).with.offset(0);
        
        
        
    }];
    
    
    //线条
    UIView *view =[[UIView alloc]init];
    
    lineView = view;
    view.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        
        make.top.equalTo(_headImage.mas_bottom).offset(25*SCALE+15+3+15);
        
        make.right.equalTo(self.view.mas_right).offset(0);
        
        make.height.equalTo(@1);
    }];
    
    //上面的两个线条
    UIView *view1= [[UIView alloc]init];
    view1.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview.mas_left).offset(screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@1);
        make.height.equalTo(@(33*SCALE));
    }];
    
    
    
    
    UIView *view2= [[UIView alloc]init];
    view2.backgroundColor =[UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view2.superview.mas_right).offset(-screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@1);
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
    _Ylab= [[UILabel alloc]init];
    _Ylab.text = @"88.88";
    _Ylab.font =[UIFont systemFontOfSize:14];
    _Ylab.textAlignment = UITextAlignmentCenter;
    _Ylab.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_Ylab];
    [_Ylab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-screenWidth*0.8);
        make.top.equalTo(lab1.mas_bottom).offset(3);
        make.height.equalTo(@15.0);
    }];
    
    
    
    _Ylab1= [[UILabel alloc]init];
    _Ylab1.text = @"88.88";
    _Ylab1.font =[UIFont systemFontOfSize:14];
    _Ylab1.textAlignment = UITextAlignmentCenter;
    _Ylab1.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_Ylab1];
    [_Ylab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_right).offset(-screenWidth*0.45);
        make.height.equalTo(@15);
        
        make.top.equalTo(lab1.mas_bottom).offset(3);
        
    }];
    
    
    _Ylab2= [[UILabel alloc]init];
    _Ylab2.text = @"88.88";
    _Ylab2.font =[UIFont systemFontOfSize:14];
    _Ylab2.textAlignment = UITextAlignmentCenter;
    _Ylab2.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:_Ylab2];
    [_Ylab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(view2.mas_right).offset(screenWidth*0.22);
        make.height.mas_equalTo(@15);
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

//TODO:线条未实现
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellIdentfier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentfier];
        UIView *view2 =[[UIView alloc]initWithFrame:CGRectMake(0, 45*SCALE,SCREEN_WIDTH, 0.5)];
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

//单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController*vc= nil;
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                vc = [[SettlementViewController alloc]init];
                break;
            case 1:
                
                vc = [[IdentityViewController alloc]init];
                break;
            case 2:
                vc = [[BankcardViewController alloc]init];
                break;
            default:
                break;
        }
    }
    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0:
                vc = [[PayPasswordViewController alloc]init];
                break;
                case 1:
                vc = [[PaymentViewController alloc]init];
                break;
            default:
                break;
        }
    }
    if (indexPath.section==2&&indexPath.row==1) {
        
        ViewController *vi = [[ViewController alloc]init];
//            UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vi];
//        window.rootViewController =nav;
     //   self.modalPresentationStyle=UIModalPresentationPageSheet;
        [self presentViewController:nav animated:NO completion:nil];
        return;
        }
    
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
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
