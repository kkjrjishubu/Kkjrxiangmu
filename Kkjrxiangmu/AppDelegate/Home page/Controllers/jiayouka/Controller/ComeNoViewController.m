//
//  ComeNoViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/19.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "ComeNoViewController.h"

@interface ComeNoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cardTF;



@end

@implementation ComeNoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
}

- (void)interfaceview {
    self.navigationItem.title = @"加油卡";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jilu@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(massageAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
    
}

- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)massageAction {
    NSLog(@"账单");
    
}



- (IBAction)tenHundredAction:(id)sender {
}


- (IBAction)twohundredAction:(id)sender {
}

- (IBAction)threehundredAction:(id)sender {
}

- (IBAction)fiveHundredAction:(id)sender {
}



- (IBAction)onethousandAction:(id)sender {
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
