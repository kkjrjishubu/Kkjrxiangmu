//
//  RateTableViewController.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/18.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "RateTableViewController.h"
#import "RateView.h"
#import "RateTableViewCell.h"

@interface RateTableViewController ()

@property (nonatomic,strong)RateView *rateview;

@end

@implementation RateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = qianWhite;
    [self interfaceview];

}

- (void)interfaceview {
    self.navigationItem.title = @"费率";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[RateTableViewCell class] forCellReuseIdentifier:@"ratecell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.rowHeight = 185;
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
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ratecell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = qianWhite;
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
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
