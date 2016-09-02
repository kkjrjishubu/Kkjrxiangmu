//
//  HomePageViewController.m
//  wangguanpay
//
//  Created by Star's mac on 16/8/2.
//  Copyright © 2016年 mao. All rights reserved.
//

#import "HomePageViewController.h"
#import "FunctionCollectionViewCell.h"
#import "TopUpViewController.h"
#import "ErweimaViewController.h"
#import "BillTableViewController.h"
#import "BalanceTableViewController.h"
#import "ManageViewController.h"
#import "RateTableViewController.h"
#import "CreditTableViewController.h"
#import "TrafficViewController.h"
#import "ComeNoViewController.h"
#import "SocialViewController.h"
#import "PayCostViewController.h"
#import "GameViewController.h"
#import "XRCarouselView.h"



@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,XRCarouselViewDelegate>
@property (nonatomic, strong) XRCarouselView *carouselView;


@property (nonatomic,strong)UICollectionView *momentCollectionView;
@property (weak, nonatomic) IBOutlet UIView *viewy;


@end

@implementation HomePageViewController
{
    float collectionVCY;
    float collectionVCHeigth;
    float butX;
    float butY;
    float butHeight;
    float viewyHeight;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self collectioncustom];

    [self customXRCarouselView];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;

}

// 轮播
- (void)customXRCarouselView {
    NSArray *arr = @[
                     [UIImage imageNamed:@"lunbo1"],[UIImage imageNamed:@"luobo2.png"],//本地图片，传image，不能传名称 //网络gif图片 //本地gif使用gifImageNamed(name)函数创建
                     ];
    if (screenHeight == 667) {
        viewyHeight = 17;
    }else if (screenHeight == 736) {
        viewyHeight = 33;
    }
    
    /**
     *  通过代码创建
     */
    self.carouselView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, self.viewy.frame.size.height + viewyHeight)];
    
    //设置占位图片,须在设置图片数组之前设置,不设置则为默认占位图
    //_carouselView.placeholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];

    //设置图片及描述数组
    _carouselView.imageArray = arr;
    
    //用代理处理图片点击
    _carouselView.delegate = self;
    
    //设置每张图片的停留时间，默认值为5s，最少为2s
    _carouselView.time = 2;
    
    //设置分页控件的图片,不设置则为系统默认
    //[_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
    
    //设置分页控件的位置，默认为PositionBottomCenter
    //_carouselView.pagePosition = PositionBottomRight;
    
    [self.viewy addSubview:_carouselView];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //清除缓存
    [XRCarouselView clearDiskCache];
}


#pragma mark XRCarouselViewDelegate
- (void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}





// 表格
- (void)collectioncustom {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(screenWidth/4 - 1, 88);
    
    layout.minimumInteritemSpacing = 0; // 左右间距
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果

    layout.sectionInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    if (screenHeight == 667) {
        collectionVCY =  self.viewy.frame.size.height * 3 - 50;
        collectionVCHeigth = 275;
    }else if (screenHeight == 736) {
        collectionVCY =  self.viewy.frame.size.height * 3 - 20;
        collectionVCHeigth = 310;
        //NSLog(@"736");
        
    }
    
    
    self.momentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(1, collectionVCY, screenWidth, collectionVCHeigth) collectionViewLayout:layout];
    
    self.momentCollectionView.delegate = self;
    
    self.momentCollectionView.dataSource =self;
    self.momentCollectionView.scrollEnabled = NO;
    self.momentCollectionView.showsVerticalScrollIndicator = NO;
    
    self.momentCollectionView.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < 2; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 68 + (88 + 1) * i, screenWidth, 1)];
        view.backgroundColor = qiangrayColor;
        [self.momentCollectionView addSubview:view];
    }
    
    

    [self.view addSubview:self.momentCollectionView];
    
    
    [self.momentCollectionView registerNib:[UINib nibWithNibName:@"FunctionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"functioncell"];
    
    
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 11;
  
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FunctionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"functioncell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        
    }
    NSArray *titarr = @[@"手机充值",@"流量充值",@"社保代缴",@"交通罚款",@"加油卡",@"超值购",@"欢乐贷",@"生活缴费",@"游戏",@"理财工具",@"更多"];
    NSArray *logoarr = @[@"shouji@2x",@"liuliang@2x",@"shebao@2x",@"jiaotong@2x",@"jiayouka@2x",@"yiyuanduobao@2x",@"huanledai@2x",@"shuidian@2x",@"youxi@2x",@"licaijisuan@2x",@"gengduo@2x"];
    cell.titlable.text = titarr[indexPath.row];
    cell.logoimge.image = [UIImage imageNamed:logoarr[indexPath.row]];
    
    
    return cell;
}




#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // 手机
        TopUpViewController *topupViewc = [[TopUpViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        topupViewc.navtit = @"手机充值";
        [self.navigationController pushViewController:topupViewc animated:YES];
        
        
    }else if (indexPath.row == 1) {
        // 流量
        TopUpViewController *topupViewc = [[TopUpViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        topupViewc.navtit = @"流量充值";
        [self.navigationController pushViewController:topupViewc animated:YES];

        
    }else if (indexPath.row == 2) {
        // 社保
        SocialViewController *socialVC = [[SocialViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        
        [self.navigationController pushViewController:socialVC animated:YES];

        
        
    }else if (indexPath.row == 3) {
        // 交通
        TrafficViewController *traffivVC = [[TrafficViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        
        [self.navigationController pushViewController:traffivVC animated:YES];
        
    }else if (indexPath.row == 4) {
        // 加油卡
        ComeNoViewController *comenoVC = [[ComeNoViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        
        [self.navigationController pushViewController:comenoVC animated:YES];
        
    }else if (indexPath.row == 5) {
        // 超值
        WebViewController *webviewC = [[WebViewController alloc]init];
        webviewC.weburl = @"http://www.yinshanglv.cc/";
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:webviewC animated:YES];

    }else if (indexPath.row == 6) {
        // 欢乐贷
        
    }else if (indexPath.row == 7) {
        // 生活缴费
        PayCostViewController *paycomeVC = [[PayCostViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        
        [self.navigationController pushViewController:paycomeVC animated:YES];

    }else if (indexPath.row == 8) {
        // 游戏
        GameViewController *gameVC = [[GameViewController alloc]init];
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        
        [self.navigationController pushViewController:gameVC animated:YES];
    }else if (indexPath.row == 9) {
        // 理财
        
    }else if (indexPath.row == 10) {
        // 更多
        [NSString addMBProgressHUD:@"敬请期待" showHUDToView:self.view];
    }
}


- (IBAction)Sweeptheyard:(id)sender {
    ErweimaViewController *erweimaVC = [[ErweimaViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:erweimaVC animated:YES];
}
- (IBAction)billAction:(id)sender {
    BillTableViewController *billTVC = [[BillTableViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:billTVC animated:YES];
    
}
- (IBAction)financialAction:(id)sender {
    ManageViewController *manageVC = [[ManageViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController pushViewController:manageVC animated:YES];
    
}
- (IBAction)reimbursement:(id)sender {
    CreditTableViewController *creditTVC = [[CreditTableViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController pushViewController:creditTVC animated:YES];

    
}
- (IBAction)settlement:(id)sender {
    BalanceTableViewController *balanceTVC = [[BalanceTableViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:balanceTVC animated:YES];
    
}
- (IBAction)rateAction:(id)sender {
    
    RateTableViewController *rateTVC = [[RateTableViewController alloc]init];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:rateTVC animated:YES];

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



