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


@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIImageView *scrollview;
@property (nonatomic,strong)UICollectionView *momentCollectionView;
@property (weak, nonatomic) IBOutlet UIView *viewy;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self collectioncustom];
    
    
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;

}



// 表格
- (void)collectioncustom {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(screenWidth/4 - 1, 88);
    
    layout.minimumInteritemSpacing = 0; // 左右间距
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果

    layout.sectionInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    
    
    self.momentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(1,  self.scrollview.frame.size.height * 3 - 40, screenWidth, 265) collectionViewLayout:layout];
    
    self.momentCollectionView.delegate = self;
    
    self.momentCollectionView.dataSource =self;
    
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
    NSArray *logoarr = @[@"shouji@2x",@"liuliang@2x",@"shebao@2x",@"jiaotong@2x",@"jiayouka@2x",@"yiyuanduobao@2x",@"huanledai@2x",@"shuidian@2x",@"youxi@2x",@"l@3x.png",@"gengduo@2x"];
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
        
        [self.navigationController pushViewController:topupViewc animated:YES];
        
        NSLog(@"手机充值");
    }else if (indexPath.row == 1) {
        // 流量
        
    }else if (indexPath.row == 2) {
        // 社保
        
    }else if (indexPath.row == 3) {
        // 交通
        
    }else if (indexPath.row == 4) {
        // 加油卡
        
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
        
    }else if (indexPath.row == 8) {
        // 游戏
        
    }else if (indexPath.row == 9) {
        // 理财
        
    }else if (indexPath.row == 10) {
        // 更多
        
    }
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



