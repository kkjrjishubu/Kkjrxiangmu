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
    btn.frame = CGRectMake(120, 500, 100, 50);
    [btn setTitle:@"相机" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(saomaAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    //创建label 显示扫码的内容
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 50)];
    self.label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.label];
}

- (void)interfaceview {
    self.navigationItem.title = @"扫一扫";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
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
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [sender startScan];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
