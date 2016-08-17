//
//  CollectionViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "CollectionViewController.h"
#import "KeyboardvView.h"
#import "KeyCollectionViewCell.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)KeyboardvView *keyboardV;


@property (weak, nonatomic) IBOutlet UIView *keyView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic,strong)NSMutableString *mutString;

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
    
    [self interfaceview];
    
    [self customKeyboard];
    
}

- (void)interfaceview {
    
    self.navigationItem.title = @"收款";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = qianblue;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.mutString = [[NSMutableString alloc]initWithCapacity:20];
    
}

- (void)customKeyboard {
    
    //    self.keyboardV = [[KeyboardvView alloc]init];
    //
    //
    //
    //    [self.view  addSubview:self.keyboardV];
    //    [self.keyboardV numberbut:^{
    //        NSLog(@"11");
    //    }];
    
    
    
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
        
        NSLog(@"1");
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
    }else {
        
        NSRange range = {0 , self.mutString.length};
        //设置清除范围
        [self.mutString deleteCharactersInRange:range];
        //空标签置为0
        self.numberLabel.text = @"0";
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









