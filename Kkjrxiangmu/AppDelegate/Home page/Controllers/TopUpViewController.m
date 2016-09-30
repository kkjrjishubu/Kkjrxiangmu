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
#import "TPPasswordTextView.h"
#import "SetUpPayViewController.h"
#import "PayWTableViewCell.h"




@interface TopUpViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UIWindow *window;
@property (nonatomic,strong)UIViewController *viewcontroll;
@property (nonatomic,strong)PayMentView *payView;
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)UIViewController *viewVC;
@property (nonatomic,strong)UIView *blackview;

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
{
    NSString *titStr;
    NSString *str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self interfaceview];
    
    
}
- (void)interfaceview {
    self.navigationItem.title = self.navtit;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"huodongzongxin@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(massageAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    titStr = @"手机号不能为空";
    str = @"号码不正确";
    
    
    
}
- (IBAction)tenAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)twoAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)threeAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)fiveAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}

- (IBAction)OnehundredAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)twohundredAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)threehundredAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}
- (IBAction)FivehundredAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}

// 充值记录
- (IBAction)recordAction:(id)sender {
    if (self.phoneTF.text.length == 0 ) {
        
        [NSString addMBProgressHUD:titStr showHUDToView:self.view];
    }else if (self.phoneTF.text.length != 11){
        
        [NSString addMBProgressHUD:str showHUDToView:self.view];
    }else {
        [self paymentAction];
    }
    
}



// 付款
- (void)paymentAction {
    _window = [UIApplication sharedApplication].keyWindow;
    _blackview = [[UIView alloc]initWithFrame:self.view.frame];
    _blackview.backgroundColor = [UIColor blackColor];
    _blackview.alpha = 0.4;
    [_window addSubview:_blackview];
    _payView = [[[NSBundle mainBundle]loadNibNamed:@"PayMentView" owner:self options:nil]firstObject];
    
    
    _payView.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
    self.viewcontroll = [[UIViewController alloc]init];
    
    [self.viewcontroll.view addSubview:_payView];
    [_window addSubview:self.viewcontroll.view];
    
    [_payView sureBlockAction:^{
        NSLog(@"支付");
        __weak typeof(self) mySelf = self;
        
        [UIView animateWithDuration:0.2f animations:^{
            mySelf.payView.frame = CGRectMake(-screenWidth, screenHeight - 400, screenWidth, 400);
            
        }];
        
        [self payPassAction];
        
    }];
    [_payView payWayBlockAction:^{
        NSLog(@"付款方式");
        __weak typeof(self) mySelf = self;

        [UIView animateWithDuration:0.2f animations:^{
            mySelf.payView.frame = CGRectMake(-screenWidth, screenHeight - 400, screenWidth, 400);

        }];
        [self payWayAction];
        
    }];
    [_payView butBlock:^{
        NSLog(@"返回");
        _blackview.hidden = YES;
        self.viewcontroll.view.hidden = YES;
        _payView.hidden = YES;
        
    }];
    
    
}

- (void)payWayAction {
    
    
    self.viewVC = [[UIViewController alloc]init];
    self.viewVC.view.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
    
    [self.viewcontroll.view addSubview:self.viewVC.view];
    
    [_window addSubview:self.viewcontroll.view];
    
    PayWayView *paywayView = [[[NSBundle mainBundle]loadNibNamed:@"PayWayView" owner:self options:nil]firstObject];
    paywayView.frame = CGRectMake(0, 0, screenWidth, 55);

    [self.viewVC.view addSubview:paywayView];
    [self cusmotTableView];
    
    [paywayView backbut:^{
        NSLog(@"支付方式");
        __weak typeof(self) mySelf = self;
        
        [UIView animateWithDuration:0.2f animations:^{
            mySelf.payView.frame = CGRectMake(0 , screenHeight - 400, screenWidth, 400);
            mySelf.viewVC.view.frame = CGRectMake(screenWidth, screenHeight - 400, screenWidth, 400);
            
        }];
        
    
    }];
    
}



- (void)payPassAction {
    
    //CGPoint center = self.view.center;
    
    TPPasswordTextView *payview = [[TPPasswordTextView alloc] initWithFrame:CGRectMake(0, screenHeight - 400, screenWidth, 400)];
    payview.elementCount = 6;
    payview.backgroundColor = [UIColor whiteColor];
    //view1.center = CGPointMake(center.x, 100);
    
    [self.viewcontroll.view addSubview:payview];
    
    [_window addSubview:self.viewcontroll.view];
    payview.passwordBlock = ^(NSString *password) {
        NSLog(@"11   %@",password);
        
    };
    __weak typeof(self) mySelf = self;
    [payview backbutton:^{
        mySelf.payView.frame = CGRectMake(0 , screenHeight - 400, screenWidth, 400);
        payview.frame = CGRectMake(screenWidth, screenHeight - 400, screenWidth, 400);
    }];
    
    [payview passbutton:^{
        NSLog(@"忘记密码");
        _blackview.hidden = YES;
        self.viewcontroll.view.hidden = YES;
        
        NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
        
        SetUpPayViewController *setupPayVC = [[SetUpPayViewController alloc]init];
        setupPayVC.navtitStr = @"密码找回";
        setupPayVC.urlstr = urlStr;
        setupPayVC.actionstr = @"findPayPassword";
        setupPayVC.numberStr = @"findPayPassword_sendsms";
        [self.navigationController pushViewController:setupPayVC animated:YES];

        
    }];
}

- (void)cusmotTableView {
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 56, self.viewcontroll.view.frame.size.width, self.viewcontroll.view.frame.size.height - 56) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.rowHeight = 45;

    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    [self.viewVC.view addSubview:self.tableview];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"PayWTableViewCell" bundle:nil] forCellReuseIdentifier:@"payCell"];
    
    
}


#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        NSArray *labelarr = @[@"账户余额",@"余额理财"];
        NSArray *imageArr = @[@"zhanghuyue@2x",@"yue@2x"];
        cell.logoImage.image = [UIImage imageNamed:imageArr[indexPath.row]];
        cell.titLabel.text = labelarr[indexPath.row];
        
        
        return cell;
    }else {
        
        return cell;

    }
    
    
    
   
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
