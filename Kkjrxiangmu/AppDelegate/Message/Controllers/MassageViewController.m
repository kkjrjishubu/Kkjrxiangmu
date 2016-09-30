//
//  MassageViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "MassageViewController.h"
#import "BalanceTableViewCell.h"
#import "MessageTableViewCell.h"
#import "AnnouncementTVController.h"

@interface MassageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *dataSource;
@property (nonatomic,strong)UITableView *tablview;

@end

@implementation MassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self interface];
    self.dataSource = [NSMutableArray array];
    
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYMESSAGE];
    NSLog(@"%@",urlStr);
    
    [self NetworkIntercedes:urlStr];

    

    
    

}
-(void)interface{
    self.navigationItem.title = @"消息";
    self.navigationController.navigationBar.barTintColor = qianblue;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    UIImageView *_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 120)];
    _imageView.image = [UIImage imageNamed:@"guangao.png"];
    [self.view addSubview:_imageView];
    
    
    _tablview = [[UITableView alloc]initWithFrame:CGRectMake(0, _imageView.frame.size.height, screenWidth, screenHeight) style:UITableViewStylePlain];
    //_tablview.backgroundColor = qianWhite;
    _tablview.delegate = self;
    _tablview.dataSource = self;
    [self.view addSubview:_tablview];
    
    [_tablview registerNib:[UINib nibWithNibName:@"BalanceTableViewCell" bundle:nil] forCellReuseIdentifier:@"balanceCell"];
    [_tablview registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"messageCell"];
    _tablview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

#pragma mark -- 网络请求
- (void)NetworkIntercedes:(NSString *)strUrl   {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"messageList",
                                   @"token":tokenstr,
                                   @"pageIndex":@1,
                                   @"pageSize":@10};
    DREAMAppLog(@"消息记录 %@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        DREAMAppLog(@"%@",responseObject);
        if ([responseObject[@"Success"] integerValue] == 1) {
            // 字典转模型
            NSArray *dataArr = [MessageModel mj_objectArrayWithKeyValuesArray:responseObject[@"DataList"]];
            
            [self.dataSource addObjectsFromArray:dataArr];
            
            [userDefaults setObject:responseObject[@"Token"] forKey:@"tokenKey"];
            [userDefaults synchronize];
            DREAMAppLog(@"数据源 %@",self.dataSource);
            [_tablview reloadData];
            
        }else {
            [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
        }
        
        
    } failur:^(id error) {
        DREAMAppLog(@"%@",error);
    }];
}




#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else {
        return self.dataSource.count;
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        return cell;

    }else {
        BalanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"balanceCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        MessageModel *messageM = self.dataSource[indexPath.row];
        [cell getCellDataWithMessageModels:messageM];
        
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AnnouncementTVController *announmentTVC = [[AnnouncementTVController alloc]init];
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:announmentTVC animated:YES];
        
    }else {
        //MessageModel *messageM = self.dataSource[indexPath.row];
        //[NSString addMBProgressHUD:messageM.SendContent showHUDToView:self.view];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50.0;
    }else {
        MessageModel *messageM = self.dataSource[indexPath.row];
        CGFloat labelHeight = [NSString adaptiveWithText:messageM.SendContent];
        
        return 50 + labelHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10;

    
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
