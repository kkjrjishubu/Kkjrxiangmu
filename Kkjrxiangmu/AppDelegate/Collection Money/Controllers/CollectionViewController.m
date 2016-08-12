//
//  CollectionViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "CollectionViewController.h"
#import "KeyboardvView.h"


@interface CollectionViewController ()

@property (nonatomic,strong)KeyboardvView *keyboardV;



@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    
    [self customKeyboard];
    
}

- (void)interfaceview {
    
    self.navigationItem.title = @"收款";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

- (void)customKeyboard {
    
    
    
    self.keyboardV = [[KeyboardvView alloc]init];
    
    [self.view  addSubview:self.keyboardV];
    
    
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









