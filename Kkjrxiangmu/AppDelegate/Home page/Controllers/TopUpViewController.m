//
//  TopUpViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/15.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "TopUpViewController.h"
#import "PayMentView.h"
#import "PayWayView.h"


@interface TopUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;// 手机
@property (weak, nonatomic) IBOutlet UILabel *titlabel;// 地区
@property (weak, nonatomic) IBOutlet UILabel *tenLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *OnehundredL;
@property (weak, nonatomic) IBOutlet UILabel *TwohundredL;
@property (weak, nonatomic) IBOutlet UILabel *ThreehundredL;
@property (weak, nonatomic) IBOutlet UILabel *fivehundredL;

@end

@implementation TopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    
    
}


- (void)interfaceview {
    self.navigationItem.title = @"手机充值";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"huodongzongxin@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(massageAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
}





- (IBAction)tenAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        NSLog(@"手机号不能为空");
    }else if (self.phoneTF.text.length != 11){
        NSLog(@"号码不正确");
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)twoAction:(id)sender {
}
- (IBAction)threeAction:(id)sender {
}
- (IBAction)fiveAction:(id)sender {
}

- (IBAction)OnehundredAction:(id)sender {
}
- (IBAction)twohundredAction:(id)sender {
}
- (IBAction)threehundredAction:(id)sender {
}
- (IBAction)FivehundredAction:(id)sender {
}

// 充值记录
- (IBAction)recordAction:(id)sender {
}



// 付款
- (void)paymentAction {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *blackView = [[UIView alloc]initWithFrame:self.view.frame];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.4;
    [window addSubview:blackView];
    PayMentView *payView = [[[NSBundle mainBundle]loadNibNamed:@"PayMentView" owner:self options:nil]firstObject];
    //赋值
    //    votingView.label1.text = [NSString stringWithFormat:@"%@元",self.moneyTF.text];
    //    CGFloat rate = [self.moneyTF.text intValue]/self.voting.final_valuation;
    //    votingView.label2.text = [NSString stringWithFormat:@"%.2f%%",rate *100];
    //    votingView.label3.text = [NSString stringWithFormat:@"%@元",self.allMoneyLabel.text];
    //    CGFloat rate2 = [self.allMoneyLabel.text intValue]/self.voting.final_valuation;
    //    votingView.label4.text = [NSString stringWithFormat:@"%.2f%%",rate2 *100];
    payView.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
    UIViewController *containerVC = [[UIViewController alloc]init];
    [containerVC.view addSubview:payView];
    [window addSubview:containerVC.view];
    
    [payView sureBlockAction:^{
        NSLog(@"确定");
    }];
    [payView payWayBlockAction:^{
        NSLog(@"付款方式");
        blackView.hidden = YES;
        containerVC.view.hidden = YES;
        payView.hidden = YES;
        [self payWayAction];
        
    }];
    [payView butBlock:^{
        NSLog(@"返回");
        blackView.hidden = YES;
        containerVC.view.hidden = YES;
        payView.hidden = YES;
        
    }];
    
    
}



- (void)payWayAction {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *blackView = [[UIView alloc]initWithFrame:self.view.frame];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.4;
    [window addSubview:blackView];
    PayWayView *payview = [[[NSBundle mainBundle]loadNibNamed:@"PayWayView" owner:self options:nil]firstObject];
    //赋值
    //    votingView.label1.text = [NSString stringWithFormat:@"%@元",self.moneyTF.text];
    //    CGFloat rate = [self.moneyTF.text intValue]/self.voting.final_valuation;
    //    votingView.label2.text = [NSString stringWithFormat:@"%.2f%%",rate *100];
    //    votingView.label3.text = [NSString stringWithFormat:@"%@元",self.allMoneyLabel.text];
    //    CGFloat rate2 = [self.allMoneyLabel.text intValue]/self.voting.final_valuation;
    //    votingView.label4.text = [NSString stringWithFormat:@"%.2f%%",rate2 *100];
    payview.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
    UIViewController *containerVC = [[UIViewController alloc]init];
    [containerVC.view addSubview:payview];
    [window addSubview:containerVC.view];
    
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

// 活动
- (void)massageAction {
    
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
