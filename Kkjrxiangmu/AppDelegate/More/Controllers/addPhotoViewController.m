//
//  addPhotoViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/22.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "addPhotoViewController.h"
#import "PhotoCollectionViewCell.h"
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define IphoeW    [UIScreen mainScreen].bounds.size.width
#define IphoeH    [UIScreen mainScreen].bounds.size.height
#define SCALE screenWidth/375.0

@interface addPhotoViewController ()<PhotoCollectionViewCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSMutableArray * imageArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger num;
@end

@implementation addPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backViewColor;
    self.title = @"添加照片";
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UITextView *textView = [[UITextView alloc]init];//WithFrame:CGRectMake(0, 100, IphoeH, IphoeW)];
    //textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(20*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-20*SCALE);
        make.height.mas_equalTo(180*SCALE);
    }];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, IphoeW, IphoeH) collectionViewLayout:flowLayout];
        self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = backViewColor;
    //注册cell
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textView.mas_bottom).offset(10*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(IphoeH-textView.frame.size.height);
    }];

    self.num = 1;
    _imageArr = [NSMutableArray array];
    UIButton *tJbutton = [[UIButton alloc]init];
    [tJbutton addTarget:self action:@selector(tJbuttoncilick) forControlEvents:UIControlEventTouchUpInside];
    [tJbutton setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:tJbutton];
    tJbutton.layer.cornerRadius = 10*SCALE;
    tJbutton.layer.masksToBounds = YES;
    tJbutton.backgroundColor = qianblue;
    [tJbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(-40*SCALE);
        make.top.mas_equalTo(textView.mas_bottom).offset(160*SCALE);
        make.height.mas_equalTo(40*SCALE);
    }];
}



#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.num;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        
    }
    cell.delegate = self;
    
    if (indexPath.row == 0 && _imageArr.count == 0) {
        cell.removeBtn.hidden = YES;
    }
    
    if (indexPath.row + 1 > _imageArr.count) {//因为item有个占位的
        cell.imageview.image = [UIImage imageNamed:@"photo_add@3x"];
        cell.removeBtn.hidden = YES;
        return cell;
    }else{
        if (_imageArr.count == 0) {
            cell.imageview.image = [UIImage imageNamed:@"photo_add@3x"];
            return cell;
        }else{
            
            cell.imageview.image = [_imageArr objectAtIndex:indexPath.row];
            cell.removeBtn.hidden = NO;
        }
    }
    
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((IphoeW - 80*SCALE) / 3, (IphoeW - 80*SCALE) / 3);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10*SCALE, 37*SCALE, 37*SCALE);
}
//定义每个UICollectionView 纵向的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"11111选择%ld",indexPath.row);
    if (IOS7) {
        
        UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"相册选取", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
        [actionSheet showInView:self.view];
        
    }else{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //        相机
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            [imgPicker setAllowsEditing:YES];
            [imgPicker setDelegate:self];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:imgPicker animated:YES completion:NULL];
            
        }];
        
        UIAlertAction *archiveAction2 = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            [imgPicker setAllowsEditing:YES];
            [imgPicker setDelegate:self];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:imgPicker animated:YES completion:NULL];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:archiveAction];
        [alertController addAction:archiveAction2];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark UIActionSheet协议
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0)
    {
        //        相机
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imgPicker animated:YES completion:NULL];
    }
    if (buttonIndex ==1) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        [imgPicker setAllowsEditing:YES];
        [imgPicker setDelegate:self];
        [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imgPicker animated:YES completion:NULL];
    }
}

//相机
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [_imageArr addObject:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.num ++;
    if (self.num<=4) {
        [self.collectionView reloadData];

    }else{
        PhotoCollectionViewCell *photo = [[PhotoCollectionViewCell alloc]init];
        photo.imageview.hidden = YES;
    }
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    return;
}

#pragma mark --PhotoCollectionViewCellDelegate
-(void)moveImageBtnClick:(PhotoCollectionViewCell *)aCell{
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:aCell];
    if (_imageArr.count == 0) {
        return;
    }
    [_imageArr removeObjectAtIndex:indexPath.row];
    self.num --;
    [self.collectionView reloadData];
}
-(void)tJbuttoncilick{
    NSLog(@"提交反馈信息");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
