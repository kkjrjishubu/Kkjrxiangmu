//
//  PaymentViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "PaymentViewController.h"
#import "ZFViewController.h"
#import "SetUpPayViewController.h"

#define SCALE screenWidth/375.0
@interface PaymentViewController ()

@property (nonatomic,strong)UITextField *Textfiled;
@property (nonatomic,strong)UITextField *Textfiled1;
@property (nonatomic,strong)UITextField *Textfiled2;


@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付密码";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"为了您的账号安全,修改密码前请填写原密码";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12];
    //  lab.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(screenWidth);
    }];
    //图片1
    UIImageView *imageView1 = [[UIImageView alloc]init];
    [self.view addSubview:imageView1];
    imageView1.image = [UIImage imageNamed:@"mima@2x"];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(130*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
    }];
    //线条1
    UIView *Xview1 = [[UIView alloc]init];
    Xview1.backgroundColor = xianClole;
    [self.view addSubview:Xview1];
    [Xview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView1.mas_top).offset(45*SCALE);
    }];
    //图片2
    UIImageView *imageView2 = [[UIImageView alloc]init];
    [self.view addSubview:imageView2];
    imageView2.image = [UIImage imageNamed:@"mima@2x"];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(imageView1.mas_centerX).offset(0);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
        make.top.equalTo(imageView1.mas_top).offset(60*SCALE);
    }];
    //线条2
    UIView *Xview2 = [[UIView alloc]init];
    Xview2.backgroundColor = xianClole;
    [self.view addSubview:Xview2];
    [Xview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView2.mas_top).offset(45*SCALE);
    }];
    //图片3
    UIImageView *imageView3 = [[UIImageView alloc]init];
    [self.view addSubview:imageView3];
    imageView3.image = [UIImage imageNamed:@"mima@2x"];
    
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(24*SCALE);
        make.width.mas_equalTo(21*SCALE);
        make.top.equalTo(imageView2.mas_top).offset(60*SCALE);
    }];
    //线条3
    UIView *Xview3 = [[UIView alloc]init];
    Xview3.backgroundColor = xianClole;
    [self.view addSubview:Xview3];
    [Xview3 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(imageView3.mas_top).offset(45*SCALE);
    }];
    //输入框
    self.Textfiled = [[UITextField alloc]init];
    _Textfiled.placeholder = @"请输入您的手机号";
    _Textfiled.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_Textfiled];
    [_Textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY).offset(0);
        make.left.equalTo(imageView1.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    self.Textfiled1 = [[UITextField alloc]init];
    _Textfiled1.placeholder = @"请输入您的原支付密码";
    _Textfiled1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_Textfiled1];
    [_Textfiled1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView2.mas_centerY).offset(0);
        make.left.equalTo(imageView2.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    self.Textfiled2 = [[UITextField alloc]init];
    _Textfiled2.placeholder = @"请输入新支付密码";
    _Textfiled2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_Textfiled2];
    [_Textfiled2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView3.mas_centerY).offset(0);
        make.left.equalTo(imageView3.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    
    //确认修改
    UIButton*Completebutton = [[UIButton alloc]init];
    Completebutton.backgroundColor = qianblue;
    [Completebutton addTarget:self action:@selector(completebcilick) forControlEvents:UIControlEventTouchUpInside];
    [Completebutton setTitle:@"确认修改" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 4*SCALE;
    Completebutton.layer.masksToBounds = YES;
    
    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(Xview3.mas_bottom).offset(80*SCALE);
    }];
    //忘记密码
    UIButton *button =[[UIButton alloc]init];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(cilickWJ) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"忘记密码" forState:UIControlStateNormal];
    button.backgroundColor = qianblue;
    button.layer.cornerRadius = 2*SCALE;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Completebutton.mas_top).offset(-20*SCALE);
        make.right.equalTo(Completebutton.mas_right).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(100*SCALE);
        
    }];

}

- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)cilickWJ{
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    
    SetUpPayViewController *setupPayVC = [[SetUpPayViewController alloc]init];
    setupPayVC.navtitStr = @"密码找回";
    setupPayVC.urlstr = urlStr;
    setupPayVC.actionstr = @"findPayPassword";
    setupPayVC.numberStr = @"findPayPassword_sendsms";
    [self.navigationController pushViewController:setupPayVC animated:YES];
    
       //ZFViewController *Back = [[ZFViewController alloc]init];
       //[self.navigationController pushViewController:Back animated:YES];
}

//修改密码
-(void)completebcilick{
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    NSDictionary *dic = @{@"action":@"editPayPassword",
                          @"userName":self.Textfiled.text,
                          @"passWord":self.Textfiled1.text,
                          @"newPassWord":self.Textfiled2.text};
    
    if (self.Textfiled2.text.length == 6) {
        
        [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:urlStr parameters:dic success:^(id responseObject) {
            NSLog(@"验证 %@",responseObject);
            if ([responseObject[@"Success"] integerValue] == 1) {
                
                [self promptView];
            }else {
                [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
            }
        } failur:^(id error) {
            NSLog(@"%@",error);
        }];
    }else {
        [NSString addMBProgressHUD:@"请输入六位数字密码" showHUDToView:self.view];
    }
    
}
- (void)promptView {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *blackview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    blackview.backgroundColor = [UIColor blackColor];
    blackview.alpha = 0.4;
    [window addSubview:blackview];
    PromptView *prompTV = [[[NSBundle mainBundle]loadNibNamed:@"PromptView" owner:self options:nil]firstObject];
    
    
    prompTV.frame = CGRectMake(40, screenHeight/2 - 100, screenWidth - 80, 200);
    UIViewController *viewcontroll = [[UIViewController alloc]init];
    
    [viewcontroll.view addSubview:prompTV];
    [window addSubview:viewcontroll.view];
    
    [prompTV sureBlock:^{
        blackview.hidden = YES;
        viewcontroll.view.hidden = YES;
        [self.navigationController popViewControllerAnimated:YES];
        
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
