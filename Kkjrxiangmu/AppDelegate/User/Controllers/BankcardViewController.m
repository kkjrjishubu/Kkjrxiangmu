//
//  BankcardViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "BankcardViewController.h"
#define SCALE screenWidth/375.0
#import "AddViewController.h"
#import "modeloler.h"
#define CellHeighT 120*SCALE
@interface BankcardViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *viewcc;
    //当前的单元格
   NSInteger indexCont;
//  //单元格的数量
//    NSInteger indesice;
//    
//    
//    
// //银行卡的类型
//    NSString *backTypetext;
// //银行名称
//    NSString *backName;
// //银行卡号
//    NSString *BankNo;
    UITableView *_tableView ;
    
}
@property(nonatomic,strong)NSMutableArray *arrayDasuer;
@end

@implementation BankcardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // self.view.backgroundColor = backViewColor;
    self.navigationItem.title = @"银行卡管理";

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10*SCALE, self.view.frame.size.width, self.view.frame.size.height+54) style:UITableViewStylePlain];
    _tableView.rowHeight = CellHeighT;
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.backgroundColor = backViewColor;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    
    
    self.arrayDasuer = [NSMutableArray array];

    
    UIButton*button1 = [[UIButton alloc]init];
    button1.backgroundColor = qianblue;
    button1.layer.cornerRadius = 10*SCALE;
    button1.layer.masksToBounds = YES;
    button1.titleLabel.font = [UIFont systemFontOfSize:13];
    [button1 setTitle:@"添加银行卡" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-60*SCALE);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
    [button1 addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];

    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *myString = [userDefaultes objectForKey:@"tokenKey"];
    NSLog(@"输出的Tonkeny的值 %@",myString);
    NSDictionary * dic = @{@"action":@"getList",@"token":myString};
    NSLog(@"入参字典 %@",dic);
    [[NetWorkHelper shareNetWorkEngine]PostResponseNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/BankCard.ashx" parameters:dic success:^(id responseObject) {
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *responDic = [NSMutableDictionary dictionaryWithJsonString:string];
        NSString *tonkenary = responDic[@"Token"];
        NSLog(@"qqqq   %@",responDic);
        [userDefaultes setObject:tonkenary forKey:@"tokenKey"];
        indexCont = [responDic[@"index"] integerValue]+1;
        NSLog(@"单元格个数%ld",(long)indexCont);
        if ([responDic[@"Success"] integerValue]==1) {
            NSArray *dataArr = [modeloler mj_objectArrayWithKeyValuesArray:responDic[@"DataList"]];
            //NSString *result  =[[ NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"输出的数组 %@",dataArr);
            [self.arrayDasuer addObjectsFromArray:dataArr];
            
            [_tableView reloadData];

        }else{
            [NSString addMBProgressHUD:responDic[@"Msg"] showHUDToView:self.view];
        }
    } failur:^(id error) {
        NSLog(@"错误   %@",error);
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   // NSLog(@"第二次输出单元格的个数 %ld",(long)indexCont);
    
    
    return self.arrayDasuer.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIentifier];
     //3.如果从重用队列中没有找到(也就是cell == nil),那就创建新的单元格.
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIentifier];
    }
    viewcc = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 90, 90)];

    viewcc.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:36.0/255.0 green:172.0/255.0 blue:148.0/255.0 alpha:100];
    [cell.contentView addSubview:viewcc];
    
    viewcc.layer.cornerRadius = 10*SCALE;
    
    viewcc.layer.masksToBounds = YES;
        [viewcc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView.mas_left).offset(10*SCALE);
            make.width.mas_equalTo(self.view.frame.size.width-20*SCALE);
            make.height.mas_equalTo(CellHeighT-10*SCALE);
            make.top.mas_equalTo(cell.contentView.mas_top).offset(10*SCALE);
        }];
    UIImageView *conImageView = [[UIImageView alloc]init];
    [cell.contentView addSubview:conImageView];
    conImageView.backgroundColor = [UIColor redColor];
    conImageView.layer.cornerRadius = 20*SCALE;
    conImageView.layer.masksToBounds = YES;
    [conImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.contentView.mas_left).offset(20*SCALE);
        make.top.mas_equalTo(cell.contentView.mas_top).offset(20*SCALE);
        make.width.mas_equalTo(40*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
    
    UILabel *backText =[[UILabel alloc]init];
    backText.font = [UIFont systemFontOfSize:16];
   // backText.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:backText];
    [backText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(conImageView.mas_right).offset(10*SCALE);
        make.top.mas_equalTo(cell.contentView.mas_top).offset(20*SCALE);
        make.width.mas_equalTo(cell.contentView.frame.size.width-70*SCALE);
        make.height.mas_equalTo(20*SCALE);
    }];
    UILabel *backType =[[UILabel alloc]init];
  //  backType.textColor = [UIColor whiteColor];
    backType.font = [UIFont systemFontOfSize:12];
    [cell.contentView addSubview:backType];
    [backType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(conImageView.mas_right).offset(10*SCALE);
        make.bottom.mas_equalTo(conImageView.mas_bottom).offset(0*SCALE);
        make.width.mas_equalTo(70*SCALE);
        make.height.mas_equalTo(20*SCALE);
    }];
    
    UILabel *NumberPhone = [[UILabel alloc]init];
    [cell.contentView addSubview:NumberPhone];
    [NumberPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(conImageView.mas_right);
        make.top.mas_equalTo(cell.contentView.mas_top).offset(60*SCALE);
        make.width.mas_equalTo(cell.contentView.frame.size.width-210*SCALE);
        make.height.mas_equalTo(20*SCALE);
    }];
    UILabel *numberPhone = [[UILabel alloc]init];
    [cell.contentView addSubview:numberPhone];
    [numberPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(NumberPhone.mas_right).offset(5*SCALE);
        make.centerY.mas_equalTo(NumberPhone.mas_centerY);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(60*SCALE);
    }];
    UIImageView *logoImageView = [[UIImageView alloc]init];
    [cell.contentView addSubview:logoImageView];
   // logoImageView.backgroundColor = [UIColor redColor];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.mas_left).offset(300*SCALE);
      //  make.centerY.mas_equalTo(viewcc.mas_centerY);
        make.top.mas_equalTo(cell.contentView.mas_top).offset(20*SCALE);
        make.width.mas_equalTo(50*SCALE);
        make.height.mas_equalTo(30*SCALE);
    }];
    
    //图片
    modeloler *rateModel = self.arrayDasuer[indexPath.row];
   [conImageView sd_setImageWithURL:[NSURL URLWithString:rateModel.BankIcon] placeholderImage:nil];
    [logoImageView sd_setImageWithURL:[NSURL URLWithString:rateModel.CardFlagIcon]placeholderImage:nil];
    backText.text = rateModel.BankTypeText;
    backType.text = rateModel.CardTypeText;
    NumberPhone.text = @"**** **** **** ";
    NSString* sabc = [rateModel.BankNo substringToIndex:4];
    numberPhone.text = sabc;
    NSLog(@"输出%@",rateModel.BankTypeText);
    NSLog(@"输出%@",rateModel.CardTypeText);
    NSLog(@"输出%@",rateModel.BankNo);
    NSLog(@"输出%@",rateModel.BankIcon);
    //取消选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = backViewColor;

    return cell;
}


-(void)cilick{
    AddViewController*addview = [[AddViewController alloc]init];
    [self.navigationController pushViewController:addview animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
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
