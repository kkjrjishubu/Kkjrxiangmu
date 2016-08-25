//
//  TrafficViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/19.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "TrafficViewController.h"

@interface TrafficViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topview;
@property (nonatomic,strong)UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *carBut;

@end

@implementation TrafficViewController
{
    NSInteger width;
    BOOL yesNo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = qianWhite;
    [self interfaceview];
    
    [self cusmotTableView];
    self.tableview.hidden = YES;
}


- (void)interfaceview {
    self.navigationItem.title = @"交通罚款";
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

- (IBAction)typeCar:(id)sender {
    
    
    if (yesNo == NO) {
        yesNo = YES;
        self.tableview.hidden = NO;

    }else {
        yesNo = NO;

        self.tableview.hidden = YES;
        

    }
    
}

- (void)cusmotTableView {
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(screenWidth - 245, 128,self.topview.frame.size.width / 2 - 12, 135) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    self.tableview.rowHeight = 45;
    
    self.tableview.scrollEnabled = NO;
    
    [self.view addSubview:self.tableview];
    
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}


#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSArray *labelarr = @[@"大型车",@"小型车",@"两.三轮摩托车"];
    cell.textLabel.text = labelarr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        [self.carBut setTitle:@"大型车" forState:UIControlStateNormal];
        
    }else if (indexPath.row == 1) {
        
        [self.carBut setTitle:@"小型车" forState:UIControlStateNormal];
        
    }else {
        [self.carBut setTitle:@"两.三轮摩托车" forState:UIControlStateNormal];
        
    }
    
}


- (IBAction)queryBut:(id)sender {
    NSLog(@"查询");
    
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
