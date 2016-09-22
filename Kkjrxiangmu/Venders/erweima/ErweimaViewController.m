//
//  ErweimaViewController.m
//  MicroVideo
//
//  Created by lanouhn on 15/12/17.
//  Copyright © 2015年 zhaoshuai. All rights reserved.
//

#import "ErweimaViewController.h"
#import "SHBQRView.h"
@interface ErweimaViewController ()<SHBQRViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)UILabel *label;
@property (nonatomic,strong)NSUserDefaults *userDefaults;
@property (nonatomic,copy)NSString *payStr;


@end

@implementation ErweimaViewController

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self interfaceview];
    
    SHBQRView *shbqV = [[SHBQRView alloc] initWithFrame:self.view.bounds];
    shbqV.delegate = self;
    [self.view addSubview:shbqV];
    
    //创建相机按钮
    //创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((screenWidth - 100) / 2,screenHeight / 2 + 50, 100, 50);
    [btn setTitle:@"相册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(saomaAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    


}

- (void)interfaceview {
    self.navigationItem.title = @"扫一扫";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    
//    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
//    lhScanQCodeViewController * sqVC = [[lhScanQCodeViewController alloc]init];
//    UINavigationController * nVC = [[UINavigationController alloc]initWithRootViewController:sqVC];
//    [self presentViewController:nVC animated:YES completion:^{
//        
//    }];

    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

    
    //创建label 显示扫码的内容
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, screenWidth - 20, 50)];
    self.label.backgroundColor = qianblue;
    //[self.view addSubview:self.label];

    
    
}



- (void)saomaAction {
    UIImagePickerController *pickerV = [[UIImagePickerController alloc] init];
    //设置代理
    pickerV.delegate = self;
    //选中图片允许编辑
    pickerV.allowsEditing = YES;
    //跳转到相册
    [self presentViewController:pickerV animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:true completion:^{
        //获取照片
        UIImage *image = info[UIImagePickerControllerEditedImage];
        if (!image) {
            image = info[UIImagePickerControllerOriginalImage];
        }
        //把照片转换成二进制流
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(true), kCIContextPriorityRequestLow : @(false)}];
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:nil];
        CIImage *ciImage = [CIImage imageWithData:imageData];
        
        NSArray *ar = [detector featuresInImage:ciImage];
        
        CIQRCodeFeature *feature = [ar firstObject];
        
        NSLog(@"detector: %@", detector);
        NSLog(@"context: %@", feature.messageString);
        
        if (feature.messageString == nil) {
            UIAlertController *alerV = [UIAlertController alertControllerWithTitle:@"" message:@"图片没有二维码" preferredStyle:UIAlertControllerStyleAlert];
            [alerV addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alerV animated:YES completion:nil];
        }else {
            self.label.text = [NSString stringWithFormat:@"扫描结果是:  %@", feature.messageString];
            
            UIAlertController *alerV = [UIAlertController alertControllerWithTitle:@"扫描结果" message:feature.messageString preferredStyle:UIAlertControllerStyleAlert];
            [alerV addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alerV animated:YES completion:nil];
        }
    }];
    
    
}





#pragma  mark - 扫描成功回调的函数
//扫描成功回调的函数
- (void)qrView:(SHBQRView *)sender ScanResult:(NSString *)result {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"扫码结果是---%@", result] preferredStyle:UIAlertControllerStyleAlert];
    self.payStr = result;
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYGETPAYURL];
    NSLog(@"%@  %@",urlStr,self.payStr);
    [self NetworkIntercede:urlStr];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [sender startScan];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}

#pragma mark -- 网络请求
- (void)NetworkIntercede:(NSString *)strUrl   {
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [_userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"qrCodeData":_payStr,
                                   @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        //DREAMAppLog(@"%@",responseObject);
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *infoDic = [NSMutableDictionary dictionaryWithJsonString:string];
        if ([infoDic[@"Success"] integerValue] == 1) {
            
            NSString *payurl = infoDic[@"PayAddress"];
            WebViewController *webviewC = [[WebViewController alloc]init];
            webviewC.weburl = payurl;
            self.navigationController.navigationBar.hidden = NO;
            self.tabBarController.tabBar.hidden = YES;
            webviewC.navStr = @"付款";
            
            [self.navigationController pushViewController:webviewC animated:YES];
            
        }else {
            [NSString addMBProgressHUD:infoDic[@"Msg"] showHUDToView:self.view];
        }
        
        
        DREAMAppLog(@"%@ %@",infoDic,infoDic[@"Msg"]);
        
    } failur:^(id error) {
        NSLog(@"%@",error);
    }];
    
    
}



- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
