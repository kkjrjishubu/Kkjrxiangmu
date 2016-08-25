//
//  PhotoCollectionViewCell.h
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/22.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoCollectionViewCell;

@protocol PhotoCollectionViewCellDelegate <NSObject>

-(void)moveImageBtnClick:(PhotoCollectionViewCell *)aCell;

@end


@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic ,strong) UIImageView *imageview;
@property (nonatomic, strong) UIButton *removeBtn;

@property (nonatomic, strong) id <PhotoCollectionViewCellDelegate> delegate;

@end
