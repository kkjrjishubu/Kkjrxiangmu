//
//  SHBQRView.h
//  MicroVideo
//
//  Created by lanouhn on 15/12/17.
//  Copyright © 2015年 zhaoshuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHBQRView;
@protocol SHBQRViewDelegate <NSObject>

//代理 把自己和结果传过去
- (void)qrView:(SHBQRView *)sender ScanResult:(NSString *)result;

@end


@interface SHBQRView : UIView

//设置代理 (用arc weak   mrc assign)
@property (nonatomic, weak)id<SHBQRViewDelegate>delegate;


//开始
- (void)startScan;
//结束
- (void)stopScan;

@end
