
//
//  SetUpPayViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/8.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "SetUpPayViewController.h"


@interface SetUpPayViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *butimage;
@property (nonatomic,strong)IDCountDownButton *countdownBut;

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTF;

@property (weak, nonatomic) IBOutlet UITextField *passwTF;

@end

@implementation SetUpPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    [self addCountdown];
    
    
}

- (void)interfaceview {
    self.navigationItem.title = self.navtitStr;
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
}

- (void)addCountdown {
    // 创建vertificationCodeIDCountDownButton
    self.countdownBut = [[IDCountDownButton alloc] initWithFrame:CGRectMake(2, 2, self.butimage.frame.size.width-148, self.butimage.frame.size.height-105)];
    [self.countdownBut addTarget:self action:@selector(vertificationCodeIDCountDownButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.countdownBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.countdownBut setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.countdownBut.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.countdownBut.backgroundColor = qianblue;
    self.countdownBut.layer.masksToBounds = YES;
    self.countdownBut.layer.cornerRadius = self.countdownBut.frame.size.width / 50;
    [self.butimage addSubview:self.countdownBut];
}

- (void)vertificationCodeIDCountDownButtonClick:(UIButton *)button {
    // TODO：调用服务器接口，获取验证码
    NSLog(@"发送");
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    NSDictionary *dic = @{@"action":self.numberStr,
                          @"userName":self.phoneTF.text};
    DREAMAppLog(@"%@",dic);
    if (self.phoneTF.text.length == 11) {
        // 设置倒计时时长
        self.countdownBut.durationOfCountDown = 60;
        [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:urlStr parameters:dic success:^(id responseObject) {
            NSLog(@"验证码 %@",responseObject[@"Msg"]);
            
        } failur:^(id error) {
            NSLog(@"%@",error);
        }];
    }else {
        [NSString addMBProgressHUD:@"请输入正确的手机号" showHUDToView:self.view];
    }
    
    
    
}


- (IBAction)sureAction:(id)sender {
    NSDictionary *dic = @{@"action":self.actionstr,
                          @"userName":self.phoneTF.text,
                          @"passWord":self.passwTF.text,
                          @"smsCode":self.numberTF.text};
    DREAMAppLog(@"%@",dic);
    [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:self.urlstr parameters:dic success:^(id responseObject) {
        NSLog(@"验证 %@",responseObject[@"Success"]);
        if ([responseObject[@"Success"] integerValue] == 1) {
            
            [self promptView];
        }else {
            [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        }
    } failur:^(id error) {
        NSLog(@"%@",error);
    }];

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
- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
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
