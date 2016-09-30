//
//  SettlementViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/23.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "SettlementViewController.h"
#import "BankcardViewController.h"
#define SCALE screenWidth/375.0

@interface SettlementViewController ()
{
    UIView *withView;
    NSUserDefaults *userdefauls;
    BOOL isDown;
    //单反按钮
    UIButton *allButton;
    UIButton *chooseButton;
    NSString *backId;
    NSDictionary *dictionAry;
    UITextView *textView;
    UIImageView *banckIamge;
    UILabel *banckLab;
}
@end

@implementation SettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor = qianblue;
    
    self.navigationItem.title = @"用户";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor =backViewColor;
    withView = [[UIView alloc]init];
    withView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:withView];
    [withView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left);//.offset(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right);//.offset(-30*SCALE);
        make.height.mas_equalTo(60*SCALE);
    }];
    
    //银行卡选择
    UIButton *bankSz = [[UIButton alloc]init];
    [self.view addSubview:bankSz];
    [bankSz addTarget:self action:@selector(bankCilick) forControlEvents:UIControlEventTouchUpInside];
    [bankSz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left);//.offset(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right);//.offset(-30*SCALE);
        make.height.mas_equalTo(60*SCALE);
    }];

    
    /*http://api.sfy.95yes.cn/ashx/BankCard.ashx
     
     参数说明
     
     名称	类型	说明	是否必填	示例	默认值
     action	string	get	是
     bankCardId	int	银行卡ID	是
     token	string	身份标识	是
     响应示例 异常示例
     {
     "BankType": 1,
     "Owner": "马三",
     "Branch": "石景山支行",
     "BankCityText": "石景山区",
     "BankNo": "6222021705899658875",
     "IsDefault": "1",
     "Token": "6512bd43d9caa6e02c990b0a82652dca",
     "Success": true,
     "BankProvinceText": "北京市",
     "BankCity": 111100,
     "BankTypeText": "中国银行",
     "Mobile": "18137905582", 
     "ID": 1, 
     "BankProvince": 110000
     }
*/
    userdefauls = [NSUserDefaults standardUserDefaults];
    backId = [userdefauls objectForKey:@"IDnumber"];
    NSString *token = [userdefauls objectForKey:@"tokenKey"];
    NSLog(@"输出的TOken %@",token);
    int intString = [backId intValue];
    NSDictionary *dic =@{@"action":@"get",@"bankCardId":@(intString),@"token":token};
    NSLog(@"字典 %@",dic);
    [[NetWorkHelper shareNetWorkEngine]PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/BankCard.ashx" parameters:dic success:^(id responseObject) {
        NSLog(@"输出的字典%@",responseObject);
        NSString *sabc =responseObject[@"BankIcon"];
        NSString *banktext = responseObject[@"BankTypeText"];
        [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        NSString *tokey =responseObject[@"Token"];
        [userdefauls setObject:tokey forKey:@"tokenKey"];
        /*   [userDefaultes setObject:yinhText forKey:@"yinhangmingzi"];
         [userDefaultes setObject:Tb forKey:@"yinhangtubiao"];
         [userDefaultes setObject:back_ID forKey:@"IDnumber"];
        */
        banckIamge= [[UIImageView alloc]init];
        [withView addSubview:banckIamge];
        banckIamge.layer.cornerRadius = 20*SCALE;
        banckIamge.layer.masksToBounds = YES;
        //设置图片内容
       
        [banckIamge sd_setImageWithURL:[NSURL URLWithString:sabc] placeholderImage:nil];
        [banckIamge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(withView.mas_left).offset(10*SCALE);
            make.top.mas_equalTo(withView.mas_top).offset(10*SCALE);
            make.width.mas_equalTo(40*SCALE);
            make.height.mas_equalTo(40*SCALE);
        }];
        banckLab = [[UILabel alloc]init];
        banckLab.text = banktext;
        [withView addSubview:banckLab];
        [banckLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(withView.mas_left).offset(100*SCALE);
            make.width.mas_equalTo(100*SCALE);
            make.height.mas_equalTo(30*SCALE);
            make.top.mas_equalTo(withView.mas_top).offset(15*SCALE);
        }];
        
    } failur:^(id error) {
        
    }];
    
    UIView*withView1 = [[UIView alloc]init];
    withView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:withView1];
    [withView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(withView.mas_bottom).offset(15*SCALE);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(140*SCALE);
    }];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"提现金额";
    lab.font = [UIFont systemFontOfSize:15];
    lab.textColor=[UIColor colorWithRed:171.0/255.0 green:171.0/255.0 blue:171.0/255.0 alpha:100];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.top.mas_equalTo(withView1.mas_top).offset(10*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    UILabel *moneyLab = [[UILabel alloc]init];
    moneyLab.text = @"￥";
    moneyLab.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:moneyLab];
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.top.mas_equalTo(lab.mas_top).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(40*SCALE);
    }];
    
    textView =[[UITextView alloc]init];
    textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(moneyLab.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(lab.mas_top).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
    }];
    
    UIView *Xview = [[UIView alloc]init];
    Xview.backgroundColor =xianClole;
    [self.view addSubview:Xview];
    [Xview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(lab.mas_bottom).offset(60*SCALE);

    }];
    chooseButton = [[UIButton alloc]init];
    [chooseButton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];
//    [chooseButton setTitle:@"" forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(chosallcilick) forControlEvents:UIControlEventTouchUpInside];
    chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [chooseButton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:chooseButton];
    [chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.width.mas_equalTo(26*SCALE);
        make.height.mas_equalTo(26*SCALE);
    }];
    UILabel *chooselabel = [[UILabel alloc]init];
    chooselabel.text = @"余额提现";
    chooselabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:chooselabel];
    [chooselabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(chooseButton.mas_right).offset(0*SCALE);
        make.width.mas_equalTo(100*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];

    
    
    allButton = [[UIButton alloc]init];
    [allButton addTarget:self action:@selector(chosallcilick) forControlEvents:UIControlEventTouchUpInside];
    [allButton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
    allButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [allButton setTitleColor:[UIColor colorWithRed:4.0/255.0 green:175.0/255.0 blue:200.0/255.0 alpha:100] forState:UIControlStateNormal];
    [self.view addSubview:allButton];
    [allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-70*SCALE);
        make.width.mas_equalTo(100*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];
    UILabel *allLabel = [[UILabel alloc]init];
    [self.view addSubview:allLabel];
    allLabel.text = @"分润提现";
    allLabel.font = [UIFont systemFontOfSize:15];
    [allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Xview.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(allButton.mas_right).offset(-35*SCALE);
        make.width.mas_equalTo(100*SCALE);
        make.height.mas_equalTo(25*SCALE);
    }];

    
    UILabel *Flab =[[UILabel alloc]init];
    Flab.text = @"结算余额的范围  ：2.0-50000.0";
    [self.view addSubview:Flab];
    Flab.font = [UIFont systemFontOfSize:14];
    Flab.textColor = [UIColor grayColor];
    [Flab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(withView1.mas_bottom).offset(10*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
    }];
    
    UILabel *Slab =[[UILabel alloc]init];
    Slab.text = @"手续费 ：1.0";
    [self.view addSubview:Slab];
    Slab.font = [UIFont systemFontOfSize:14];
    Slab.textColor = [UIColor grayColor];
    [Slab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30*SCALE);
        make.top.mas_equalTo(Flab.mas_bottom).offset(0*SCALE);
        make.height.mas_equalTo(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-100*SCALE);
    }];
    UIButton *button =[[UIButton alloc]init];
    button.backgroundColor = qianblue;
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTitle: @"申请结算" forState: UIControlStateNormal];
    [button addTarget:self action:@selector(buttoncilick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Slab.mas_bottom).offset(30*SCALE);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.height.mas_equalTo(40*SCALE);
        //make.width.mas_equalTo(200*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-40*SCALE);
        
    }];


}

//单反按钮
-(void)chosallcilick{
    isDown =! isDown;
    if (isDown == YES) {
        [allButton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];
        [chooseButton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
        
    }else{
        [chooseButton setImage:[UIImage imageNamed:@"duihao.png"] forState:UIControlStateNormal];
         [allButton setImage:[UIImage imageNamed:@"duihaohuise.png"] forState:UIControlStateNormal];
    }

    
}
//银行卡选择
-(void)bankCilick{
    BankcardViewController *vi = [[BankcardViewController alloc]init];
    vi.urlImage = banckIamge;
    vi.BankText = banckLab;
    [self presentViewController:vi animated:YES completion:nil];
}
//申请结算
-(void)buttoncilick{
    //        YES  分润
    //        NO   余额
    /*接口描述：
     数据格式：JSON
     
     请求方式：POST
     
     接口URL： http://api.sfy.95yes.cn/ashx/Account.ashx
     
     参数说明
     
     名称	类型	说明	是否必填	示例	默认值
     action	string	withdrawals	是
     accountType	string	balance 可用余额，profit 分润余额	是
     amount	int	提现金额（单位：分）	是
     bankCardId	int	银行卡ID	是
     token	string	身份标识	是
     响应示例 异常示例
     {
     "Msg": "提现申请发起成功！我们将在3个工作日内付款到您指定的银行卡！",
     "Token": "e10adc3949ba59abbe56e057f20f883e",
     "Success": true
     }
     */
    int string = [backId intValue];
    NSString *jiesuantoken = [userdefauls objectForKey:@"tokenKey"];
    
    int stra = [textView.text intValue];
    if (textView.text.length == 0) {
        [NSString addMBProgressHUD:@"请输入金额" showHUDToView:self.view];
        return;
    }
    
    if (isDown == YES) {
        
        dictionAry = @{@"action":@"withdrawals",@"accountType":@"balance",@"amount":@(stra),@"bankCardId":@(string),@"token":jiesuantoken};
    }else{
        
        dictionAry =@{@"action":@"withdrawals",@"accountType":@"profit",@"amount":@(stra),@"bankCardId":@(string),@"token":jiesuantoken};
    }
    
    [[NetWorkHelper shareNetWorkEngine]PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/Account.ashx" parameters:dictionAry success:^(id responseObject) {
        NSLog(@"输出的字典 %@",responseObject);
        [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        
    } failur:^(id error) {
        NSLog(@"错误的信息 %@",error);
    }];
}
-(void)backAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
