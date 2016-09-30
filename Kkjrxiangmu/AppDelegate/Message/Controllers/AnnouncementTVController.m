//
//  AnnouncementTVController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/27.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AnnouncementTVController.h"
#import "BalanceTableViewCell.h"

@interface AnnouncementTVController ()
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation AnnouncementTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self interfaceview];
    self.dataSource = [NSMutableArray array];
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYMESSAGE];
    NSLog(@"%@",urlStr);
    
    [self NetworkIntercedes:urlStr];
    
    
}

-(void)interfaceview{
    self.navigationItem.title = @"系统公告";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BalanceTableViewCell" bundle:nil] forCellReuseIdentifier:@"balanceCell"];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}


#pragma mark -- 网络请求
- (void)NetworkIntercedes:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"noticeList",
                                   @"token":tokenstr,
                                   @"pageIndex":@1,
                                   @"pageSize":@10};
    DREAMAppLog(@"消息记录 %@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        DREAMAppLog(@"%@",responseObject);
        if ([responseObject[@"Success"] integerValue] == 1) {
            // 字典转模型
            NSArray *dataArr = [MessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"DataList"]];
            NSLog(@"--  %@",dataArr);
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
}





- (void)backAction {
    self.tabBarController.tabBar.hidden = NO;

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    MessageModel *messageM = self.dataSource[indexPath.row];
    [cell getCellDataWithMessageModels:messageM];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageModel *messageM = self.dataSource[indexPath.row];
    CGFloat labelHeight = [NSString adaptiveWithText:messageM.SendContent];
    
    return 50 + labelHeight;
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
