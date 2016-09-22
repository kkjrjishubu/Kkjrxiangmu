//
//  BillTableViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BillTableViewController.h"
#import "BillTableViewCell.h"
#import "BillModel.h"


@interface BillTableViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation BillTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self interfaceview];

    self.dataSource = [NSMutableArray array];

    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYACCOUNT];
    NSLog(@"%@",urlStr);
    
    [self NetworkIntercedes:urlStr];

    
}

- (void)interfaceview {
    self.navigationItem.title = @"账单";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    

    [self.tableView registerNib:[UINib nibWithNibName:@"BillTableViewCell" bundle:nil] forCellReuseIdentifier:@"billCell"];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];

    
    
}

#pragma mark -- 网络请求
- (void)NetworkIntercedes:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"record",
                                   @"token":tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        
        if ([responseObject[@"Success"] integerValue] == 1) {
            // 字典转模型
            NSArray *dataArr = [BillModel mj_objectArrayWithKeyValuesArray:responseObject[@"DataList"]];
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
    
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"billCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    BillModel *billM = self.dataSource[indexPath.row];
    [cell getCellDataWithCreativeModels:billM];
    
    
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
