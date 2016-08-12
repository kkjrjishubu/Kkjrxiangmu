//
//  MassageViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "MassageViewController.h"

@interface MassageViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self interface];
    UITableView *_tablview = [[UITableView alloc]initWithFrame:CGRectMake(0, 186, screenWidth, screenHeight-186) style:UITableViewStylePlain];
    _tablview.delegate = self;
    _tablview.dataSource = self;
    _tablview.rowHeight = 40;
   [self.view addSubview:_tablview];

}
-(void)interface{
    UIView *_view = [[UIView alloc]initWithFrame:CGRectMake(0, 22, screenWidth, 44)];
    _view.backgroundColor = [UIColor colorWithRed:30.0/255.0 green:185.0/255.0 blue:211/255.0 alpha:100];
    [self.view addSubview:_view];
    UILabel *lab =[[UILabel alloc]init];
    lab.text = @"消息";
    lab.textColor = [UIColor whiteColor];
    lab.frame = CGRectMake(0, 0, 40, 40);
    lab.center=CGPointMake(_view.center.x, _view.center.y-20);
    lab.textAlignment = UITextAlignmentCenter;
    [_view addSubview:lab];
    UIImageView *_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 66, screenWidth, 120)];
    _imageView.image = [UIImage imageNamed:@"guangao.png"];
    [self.view addSubview:_imageView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }
    else if(section == 1) {
        return 4;
    }
    else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identcell =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identcell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Identcell];
    
    
        UIView *view2 =[[UIView alloc]initWithFrame:CGRectMake(0, 39,screenWidth, 1)];
        view2.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
        view2.tag = 2015;
        [cell.contentView addSubview:view2];
        UILabel *_datalable = [[UILabel alloc]initWithFrame:CGRectMake(2, 300, 80, 40)];
        _datalable.text = @"08-08 17:17:17";
        if (indexPath.row==0||indexPath.row==3||indexPath.row==5) {
            UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0,screenWidth, 1)];
            view1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
            [cell.contentView addSubview:view1];
        }
    
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    cell.textLabel.text =@"其他消息";
    cell.detailTextLabel.text = @"您好! 你推荐的188888888888...";
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
    if (section>=2) {
        return 300;
    }
    else{
       return 20;
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
