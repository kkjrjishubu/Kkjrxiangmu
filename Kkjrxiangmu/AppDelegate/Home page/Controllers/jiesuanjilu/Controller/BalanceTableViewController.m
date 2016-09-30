//
//  BalanceTableViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BalanceTableViewController.h"
#import "BalanceTableViewCell.h"
#import "BillModel.h"

@interface BalanceTableViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic)NSInteger page;
@property (nonatomic,copy)NSString *index_page;


@end

@implementation BalanceTableViewController
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    
    [self interfaceview];

    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYACCOUNT];
    NSLog(@"%@",urlStr);
    
    [self NetworkIntercedes:urlStr];
    
    
}

- (void)interfaceview {
    self.navigationItem.title = @"结算记录";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BalanceTableViewCell" bundle:nil] forCellReuseIdentifier:@"balanceCell"];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewdata)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoredata)];
}

- (void)loadNewdata{
    self.page = 1;
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYACCOUNT];
    
    [self NetworkIntercedes:urlStr];
}
- (void)loadMoredata{
    if (self.page <= [self.index_page intValue]+1) {
        self.page += 1;
        NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYACCOUNT];
        
        [self NetworkIntercedes:urlStr];
    }else{
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}


#pragma mark -- 网络请求
- (void)NetworkIntercedes:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"withdrawalsRecord",
                                   @"token":tokenstr,
                                   @"pageIndex":[NSString stringWithFormat:@"%ld",_page],
                                   @"pageSize":@10};
    DREAMAppLog(@"结算记录 %@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        DREAMAppLog(@"%@",responseObject);
        if ([responseObject[@"Success"] integerValue] == 1) {
            NSDictionary *listdata = [responseObject[@"DataList"] lastObject];
            self.index_page = listdata[@"index"];
            DREAMAppLog(@"responseObject  %@  ----  %@",[responseObject[@"DataList"] lastObject] , self.index_page);
            
            // 字典转模型
            NSArray *dataArr = [BillModel mj_objectArrayWithKeyValuesArray:responseObject[@"DataList"]];
            if (self.page == 1) {
                [self.dataSource removeAllObjects];
            }
            [self.dataSource addObjectsFromArray:dataArr];
            
            [userDefaults setObject:responseObject[@"Token"] forKey:@"tokenKey"];
            [userDefaults synchronize];
            DREAMAppLog(@"数据源 %@",self.dataSource);
            [self.tableView reloadData];
            
        }else {
            [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        }
        
        
    } failur:^(id error) {
        DREAMAppLog(@"%@",error);
    }];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];

}







- (void)backAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BalanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"balanceCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    BillModel *billM = self.dataSource[indexPath.row];
    [cell getCellDataWithBillModels:billM];
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
