//
//  SHBQRView.m
//  MicroVideo
//
//  Created by lanouhn on 15/12/17.
//  Copyright © 2015年 zhaoshuai. All rights reserved.
//

#import "SHBQRView.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface SHBQRView ()<AVCaptureMetadataOutputObjectsDelegate>
//链接对象
@property (nonatomic, strong)AVCaptureSession *session;
//扫描边框
@property (nonatomic, strong)UIImageView *scanView;
//扫描动画
@property (nonatomic, strong)UIImageView *lineView;



@end



@implementation SHBQRView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    //设置扫描边框
    UIImage *scanImage = [UIImage imageNamed:@"scanscanBg"];
    _scanView = [[UIImageView alloc] initWithImage:scanImage];
    
    //设置位置
    _scanView.frame = CGRectMake((Width - 200) / 2,(Height - 200) / 2, 200, 200);
    
    [self addSubview:self.scanView];
    
    //获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //闪光灯
    if ([device hasFlash] && [device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setFlashMode:AVCaptureFlashModeAuto];
        [device setTorchMode:AVCaptureTorchModeAuto];
        [device unlockForConfiguration];
    }
    
    //创建输入流
    AVCaptureInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput *outPut = [[AVCaptureMetadataOutput alloc] init];
    
    //设置代理刷新线程
    [outPut setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //设置范围
    outPut.rectOfInterest = [self rectOfInterestByScanViewRect:_scanView.frame];
    
    //初始化链接对象
    _session = [[AVCaptureSession alloc] init];
    
    //设置采集率
    _session.sessionPreset = AVCaptureSessionPresetHigh;
    if (input) {
        [_session addInput:input];
    }
    if (outPut) {
        [_session addOutput:outPut];
        //设置扫码支持的编码格式
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
        if ([outPut.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeQRCode]) {
            [array addObject:AVMetadataObjectTypeQRCode];
        }
        if ([outPut.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeEAN13Code]) {
            [array addObject:AVMetadataObjectTypeEAN13Code];
        }
        if ([outPut.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeEAN8Code]) {
            [array addObject:AVMetadataObjectTypeEAN8Code];
        }
        if ([outPut.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeCode128Code]) {
            [array addObject:AVMetadataObjectTypeCode128Code];
        }
        outPut.metadataObjectTypes = array;
    }
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    layer.frame = self.bounds;
    [self.layer insertSublayer:layer above:0];
    [self bringSubviewToFront:_scanView];
    
    //添加模糊效果
    [self setOverView];
    
    [_session startRunning];
    
    //设置动画
    [self loopDrawLine];
    
}
//显示摄像头的内容的大小
- (CGRect)rectOfInterestByScanViewRect:(CGRect)rect {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGFloat x = (height - CGRectGetHeight(rect)) / 2 / height;
    CGFloat y = (width - CGRectGetWidth(rect)) / 2 / width;
    
    CGFloat w = CGRectGetHeight(rect) / height;
    CGFloat h = CGRectGetWidth(rect) / width;
    return CGRectMake(x, y, w, h);
}


//添加模糊效果
- (void)setOverView {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGFloat x = CGRectGetMinX(_scanView.frame);
    CGFloat y = CGRectGetMinY(_scanView.frame);
    CGFloat w = CGRectGetWidth(_scanView.frame);
    CGFloat h = CGRectGetHeight(_scanView.frame);
    //除了扫描框 向其他位置添加视图 区分颜色 并设置成半透明 (除了扫描框 其他位置是模糊半透明)
    [self creatView:CGRectMake(0, 0, width, y)];
    [self creatView:CGRectMake(0, y, x, h)];
    [self creatView:CGRectMake(0, y + h, width, height - y - h)];
    [self creatView:CGRectMake(x + w, y, width - x - w, h)];
}
- (void)creatView:(CGRect)rect {
    CGFloat alpha = 0.5;
    UIColor *backColor = [UIColor grayColor];
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = backColor;
    view.alpha = alpha;
    [self addSubview:view];
}




//设置动画
- (void)loopDrawLine {
    UIImage *lineImage = [UIImage imageNamed:@"scanLine@2x"];
    
    CGFloat x = CGRectGetMinX(_scanView.frame);
    CGFloat y = CGRectGetMinY(_scanView.frame);
    CGFloat w = CGRectGetWidth(_scanView.frame);
    CGFloat h = CGRectGetHeight(_scanView.frame);
    
    CGRect start = CGRectMake(x, y, w, 2);
    CGRect end = CGRectMake(x, y + h - 2, w, 2);
    
    if (!_lineView) {
        _lineView = [[UIImageView alloc] initWithImage:lineImage];
        _lineView.frame = start;
        [self addSubview:_lineView];
    }else {
        _lineView.frame = start;
    }
    
    __weak typeof (self) SHB = self;
    [UIView animateWithDuration:2 animations:^{
        _lineView.frame = end;
    } completion:^(BOOL finished) {
        [SHB loopDrawLine];
    }];
    
}
#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    //如扫描的二维码 有内容 则让代理干活
    if (metadataObjects.count >0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects firstObject];
        if ([_delegate respondsToSelector:@selector(qrView:ScanResult:)]) {
            [_delegate qrView:self ScanResult:metadataObject.stringValue];
        }
    }
}

//开始
- (void)startScan {
    [_session startRunning];
}
//结束
- (void)stopScan {
    [_session stopRunning];
}
@end
