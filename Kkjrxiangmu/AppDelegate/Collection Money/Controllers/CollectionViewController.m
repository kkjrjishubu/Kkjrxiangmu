//
//  CollectionViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "CollectionViewController.h"
#import "PayWayView.h"
#import "RateTableViewCell.h"
#import "KeyCollectionViewCell.h"
#import "QrcodeView.h"
#import "RateModel.h"


@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UIWindow *window;
@property (nonatomic,strong)UIViewController *viewcontroll;
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)PayWayView *paywayView;
@property (nonatomic,strong)QrcodeView *qrcodeV;

@property (weak, nonatomic) IBOutlet UIView *keyView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic,strong)NSMutableString *mutString;
@property (nonatomic,copy)NSString *wxpayStr;
@property (nonatomic,strong)NSUserDefaults *userDefaults;
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,copy)NSString *typeStr;


@end

@implementation CollectionViewController
{
    float collectionVCWidth;
    float collectionVCHeight;
    float butX;
    float butY;
    float butHeight;
    float butWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.dataSource = [NSMutableArray array];
    
    [self interfaceview];
    [self customKeyboard];
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYACCOUNT];
    NSLog(@"费率 %@",urlStr);
    
    [self RateNetworkIntercede:urlStr];
    
}

- (void)interfaceview {
    
    self.navigationItem.title = @"收款";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.mutString = [[NSMutableString alloc]initWithCapacity:20];
    
}

- (void)customKeyboard {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    if (screenHeight == 667) {
        layout.itemSize = CGSizeMake(self.keyView.frame.size.width/4 - 1, 90);
        
        collectionVCWidth = self.keyView.frame.size.width - 2;
        collectionVCHeight = self.keyView.frame.size.height - 66;
        butX = screenWidth - self.keyView.frame.size.width/4 - 30;
        butY = 180;
        butHeight = 179;
        butWidth = self.keyView.frame.size.width/4 - 1;
        //NSLog(@"667 %f  %f", screenHeight ,collectionVCHeight);
    }else if (screenHeight == 736) {
        layout.itemSize = CGSizeMake(self.keyView.frame.size.width/4 + 8, 108);
        collectionVCWidth = self.keyView.frame.size.width  + 35;
        collectionVCHeight = self.keyView.frame.size.height + 2.5;
        
        butX = screenWidth - self.keyView.frame.size.width/4 - 40;
        butY = 217;
        butHeight = 210;
        butWidth = self.keyView.frame.size.width/4 + 8;
        
        //NSLog(@"736");
        
    }
    
    
    
    layout.minimumInteritemSpacing = 0; // 左右间距
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
    
    //layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    UICollectionView *keyCollectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(1, 1, collectionVCWidth, collectionVCHeight) collectionViewLayout:layout];
    
    NSLog(@"%f  %f", keyCollectionview.frame.size.height , self.keyView.frame.size.height);
    keyCollectionview.delegate = self;
    
    keyCollectionview.dataSource =self;
    keyCollectionview.scrollEnabled = NO;
    keyCollectionview.showsVerticalScrollIndicator = NO;
    
    keyCollectionview.backgroundColor = qiangrayColor;
    
    [self.keyView addSubview:keyCollectionview];
    
    NSArray *butimage = @[@"chexiao@2x",@""];
    NSArray *buttit = @[@"",@"确定"];
    for (int i = 0; i < 2; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(butX, 2 + (butY + 1) * i, butWidth, butHeight);
        but.backgroundColor = [UIColor whiteColor];
        [but setImage:[UIImage imageNamed:butimage[i]] forState:UIControlStateNormal];
        [but setTitle:buttit[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(sureCancelButAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.keyView addSubview:but];
        
    }
    
    [keyCollectionview registerNib:[UINib nibWithNibName:@"KeyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"keycell"];
    
    
    
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 16;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KeyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keycell" forIndexPath:indexPath];
    NSArray *titarr = @[@"1",@"2",@"3",@"",@"4",@"5",@"6",@"",@"7",@"8",@"9",@"",@".",@"0",@"00",@""];
    cell.titlabel.text = titarr[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    
    
    return cell;
}




#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        [self.mutString appendString:@"1"];
        
        self.numberLabel.text = self.mutString;
        
    }else if (indexPath.row == 1) {
        [self.mutString appendString:@"2"];
        
        self.numberLabel.text = self.mutString;
        
    }else if (indexPath.row == 2) {
        [self.mutString appendString:@"3"];
        
        self.numberLabel.text = self.mutString;
        
    }else if (indexPath.row == 4) {
        [self.mutString appendString:@"4"];
        
        self.numberLabel.text = self.mutString;
        
    }else if (indexPath.row == 5) {
        [self.mutString appendString:@"5"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 6) {
        [self.mutString appendString:@"6"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 8) {
        [self.mutString appendString:@"7"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 9) {
        [self.mutString appendString:@"8"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 10) {
        [self.mutString appendString:@"9"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 12) {
        [self.mutString appendString:@"."];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 13) {
        [self.mutString appendString:@"0"];
        
        self.numberLabel.text = self.mutString;

        
    }else if (indexPath.row == 14) {
        [self.mutString appendString:@"00"];
        
        self.numberLabel.text = self.mutString;

        
    }

    
    
    
}

- (void)sureCancelButAction:(UIButton *)sender {
    if ([sender.titleLabel.text isEqual:@"确定"]) {
        NSLog(@"确定");
        [self paymentAction];
        
    }else {
        
        NSRange range = {0 , self.mutString.length};
        //设置清除范围
        [self.mutString deleteCharactersInRange:range];
        //空标签置为0
        self.numberLabel.text = @"0";
    }
}



- (void)paymentAction {
    _window = [UIApplication sharedApplication].keyWindow;
    UIView *blackview = [[UIView alloc]initWithFrame:self.view.frame];
    blackview.backgroundColor = [UIColor blackColor];
    blackview.alpha = 0.4;
    [_window addSubview:blackview];
    
    self.paywayView = [[[NSBundle mainBundle]loadNibNamed:@"PayWayView" owner:self options:nil]firstObject];
    _paywayView.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
    
    self.viewcontroll = [[UIViewController alloc]init];
    
    [self.viewcontroll.view addSubview:_paywayView];
    [_window addSubview:self.viewcontroll.view];
    
    [self cusmotTableView];

    [_paywayView backbut:^{
        
        blackview.hidden = YES;
        self.viewcontroll.view.hidden = YES;
        
        
    }];
    
    
}

#pragma mark -- 网络请求
- (void)RateNetworkIntercede:(NSString *)strUrl {
    
    NSString  *tokenstr = [_userDefaults objectForKey:@"tokenKey"];

    NSDictionary *parameterdic = @{@"action":@"rate",
                                   @"product":@"1",
                                   @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        //DREAMAppLog(@"%@",responseObject);
        if ([responseObject[@"Success"] integerValue] == 1) {
            // 字典转模型
            NSArray *dataArr = [RateModel mj_objectArrayWithKeyValuesArray:responseObject[@"DataList"]];
            [self.dataSource addObjectsFromArray:dataArr];
            
            [_userDefaults setObject:responseObject[@"Token"] forKey:@"tokenKey"];
            [_userDefaults synchronize];
            
            [self.tableview reloadData];
            DREAMAppLog(@"数据源 %@",self.dataSource);
        }else {
            
            [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        }
        

        
    } failur:^(id error) {
        DREAMAppLog(@"%@",error);
    }];
    
}



- (void)cusmotTableView {
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 56, self.paywayView.frame.size.width, self.paywayView.frame.size.height - 56) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.rowHeight = 150;
    self.tableview.backgroundColor = qianWhite;
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [_paywayView addSubview:self.tableview];
    
    [self.tableview registerClass:[RateTableViewCell class] forCellReuseIdentifier:@"ratecell"];
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    
    
}


#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ratecell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = qianWhite;
    
    RateModel *rateModel = self.dataSource[indexPath.row];
    [cell getCellDataWithCreativeModel:rateModel];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        NSLog(@"微信");
        _typeStr = @"微信付款码";
        _wxpayStr = @"wxpay";
        [self customQrcodeView];
        
        __weak typeof(self) mySelf = self;
        
        [UIView animateWithDuration:0.2f animations:^{
            mySelf.paywayView.frame = CGRectMake(-screenWidth , screenHeight - 400, screenWidth, 400);
            mySelf.qrcodeV.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
            
        }];
        
    }else {
        NSLog(@"京东");
        _typeStr = @"收付易付款码";
        _wxpayStr = @"jdpay";
        [self customQrcodeView];
        
        __weak typeof(self) mySelf = self;
        
        [UIView animateWithDuration:0.2f animations:^{
            mySelf.paywayView.frame = CGRectMake(-screenWidth , screenHeight - 400, screenWidth, 400);
            mySelf.qrcodeV.frame = CGRectMake(0, screenHeight - 400, screenWidth, 400);
            
        }];
        
    }
}


- (void)customQrcodeView {
    self.qrcodeV = [[[NSBundle mainBundle]loadNibNamed:@"QrcodeView" owner:self options:nil]firstObject];
    _qrcodeV.frame = CGRectMake(screenWidth, screenHeight - 400, screenWidth, 400);
    _qrcodeV.moneyLabel.text = [NSString stringWithFormat:@"¥ %@",self.numberLabel.text];
    _qrcodeV.titleLabel.text = _typeStr;
    [self.viewcontroll.view addSubview:_qrcodeV];
    [_window addSubview:self.viewcontroll.view];
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYPAYQRCODE];
    NSLog(@"二维码 %@",urlStr);
    [self NetworkIntercede:urlStr];
    
    [_qrcodeV BackButBlockAction:^{
        __weak typeof(self) mySelf = self;
    
        [UIView animateWithDuration:0.2f animations:^{
            mySelf.paywayView.frame = CGRectMake(0 , screenHeight - 400, screenWidth, 400);
            mySelf.qrcodeV.frame = CGRectMake(screenWidth, screenHeight - 400, screenWidth, 400);
            
        }];

    }];
    
    [_qrcodeV SaveButBlockAction:^{
        NSLog(@"保存");
        UIImage *imagev = _qrcodeV.Qrimage.image;
        [self saveImageToPhotos:imagev];

    }];
    
    [_qrcodeV ShaveBlockAction:^{
        NSLog(@"分享");
    }];
}

#pragma mark -- 网络请求
- (void)NetworkIntercede:(NSString *)strUrl   {
    NSString  *tokenstr = [_userDefaults objectForKey:@"tokenKey"];

    int numberint = [self.numberLabel.text intValue] * 100;
    NSDictionary *parameterdic = @{@"action":_wxpayStr,
                                   @"amount":[NSString stringWithFormat:@"%d",numberint],
                                   @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *infoDic = [NSMutableDictionary dictionaryWithJsonString:string];
        if ([infoDic[@"Success"] integerValue] == 1) {
            NSString *qrurl = infoDic[@"QRCodeAddress"];
            [_qrcodeV.Qrimage sd_setImageWithURL:[NSURL URLWithString:qrurl] placeholderImage:nil];
            [_userDefaults setObject:infoDic[@"Token"] forKey:@"tokenKey"];
            [_userDefaults synchronize];
            

        }else{
            [NSString addMBProgressHUD:infoDic[@"Msg"] showHUDToView:_qrcodeV];
        }
        DREAMAppLog(@"%@ %@",infoDic,infoDic[@"Msg"]);

    } failur:^(id error) {
        NSLog(@"%@",error);
    }];
    
    
}

// 保存图片
- (void)saveImageToPhotos:(UIImage*)savedImage {
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}

// 指定回调方法

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo {
    
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败";
    }else{
        msg = @"保存图片成功";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    
    [alert show];
    
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









