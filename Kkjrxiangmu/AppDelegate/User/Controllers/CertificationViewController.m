//
//  CertificationViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/15.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "CertificationViewController.h"
#import "Masonry.h"
#import "IdentityViewController.h"
#define SCALE screenWidth/375.0
@interface CertificationViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIButton*button1;
    UIButton*button2;
    UIButton*button3;
    NSInteger T;
    UIImageView*_imView1;
    UIImageView *_imView;
    UIImageView*_imView2;
    //获取的图片
    UIImage *imageViewTice;
}
@end

@implementation CertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =backViewColor;
    self.navigationItem.title = @"实名认证";
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"互联网支付必须经过实名验证,请填写您的真实信息";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
    //银行卡图片
    UIImageView *YimageView = [[UIImageView alloc]init];
    YimageView.image = [UIImage imageNamed:@"yinhangrenzhengz.png"];
    [self.view addSubview:YimageView];
    [YimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lab.mas_bottom).offset(30*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.width.mas_equalTo(75*SCALE);
        make.height.mas_equalTo(48*SCALE);
        
    }];
    UILabel *Zlab = [[UILabel alloc]init];
    Zlab.text = @"银行卡正面";
    Zlab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:Zlab];
    [Zlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(YimageView.mas_centerX).offset(11.5*SCALE);
        make.top.equalTo(self.view.mas_top).offset(200*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    button1 =[[UIButton alloc]init];
    button1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button1];
    button1.layer.cornerRadius = 10*SCALE;
    button1.layer.masksToBounds = YES;
   // button1.tag = 101;
    [button1 addTarget:self action:@selector(cilickone) forControlEvents:UIControlEventTouchUpInside];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Zlab.mas_bottom);
        make.left.equalTo(Zlab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
    }];
    
    _imView = [[UIImageView alloc]init];
    _imView.image = [UIImage imageNamed:@"xiang.png"];
    [button1 addSubview:_imView];
    [_imView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button1.mas_centerX);
        make.centerY.mas_equalTo(button1.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    
    UIImageView *YimageView1= [[UIImageView alloc]init];
    YimageView1.image = [UIImage imageNamed:@"yinhangrenzhengb.png"];
    [self.view addSubview:YimageView1];
    [YimageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Zlab.mas_bottom).offset(30*SCALE);
        make.left.mas_equalTo(self.view.mas_left).offset(40*SCALE);
        make.width.mas_equalTo(75*SCALE);
        make.height.mas_equalTo(48*SCALE);
    }];
    UILabel *Flab = [[UILabel alloc]init];
    Flab.text = @"银行卡反面";
    Flab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Flab];
    [Flab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Zlab.mas_baseline).offset(100*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
        
    }];
    button2=[[UIButton alloc]init];
    button2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button2];
    button2.layer.cornerRadius = 10*SCALE;
    button2.layer.masksToBounds = YES;
  //  button2.tag = 102;
    [button2 addTarget:self action:@selector(cilicktwo) forControlEvents:UIControlEventTouchUpInside];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Flab.mas_bottom);
        make.left.equalTo(Flab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
    }];
    _imView1 = [[UIImageView alloc]init];
    _imView1.image =[UIImage imageNamed:@"xiang.png"];
    [button2 addSubview:_imView1];
    [_imView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button2.mas_centerX);
        make.centerY.mas_equalTo(button2.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    //银行卡图片2
    UIImageView *YimageView2= [[UIImageView alloc]init];
    YimageView2.image = [UIImage imageNamed:@"shouchiyinhang.png"];
    [self.view addSubview:YimageView2];
    [YimageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Flab.mas_bottom).offset(30*SCALE);
        
        make.centerX.equalTo(YimageView1.mas_centerX);
        make.width.mas_equalTo(60*SCALE);
        make.height.mas_equalTo(55*SCALE);
    }];
    
    
    UILabel *Slab = [[UILabel alloc]init];
    Slab.text =@"手持银行卡";
    Slab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:Slab];
    [Slab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Zlab.mas_centerX);
        make.top.mas_equalTo(Flab.mas_baseline).offset(100*SCALE);
        make.height.mas_equalTo(30*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    button3=[[UIButton alloc]init];
    button3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button3];
    button3.layer.cornerRadius = 10*SCALE;
    button3.layer.masksToBounds = YES;
  //  button3.tag = 103;
    [button3 addTarget:self action:@selector(cilickthree) forControlEvents:UIControlEventTouchUpInside];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(Slab.mas_bottom);
        make.left.equalTo(Slab.mas_right).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-30*SCALE);
        make.height.mas_equalTo(100*SCALE);
    }];
    //默认图片2
    _imView2 = [[UIImageView alloc]init];
    _imView2.image =[UIImage imageNamed:@"xiang.png"];
    [button3 addSubview:_imView2];
    [_imView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(button3.mas_centerX);
        make.centerY.mas_equalTo(button3.mas_centerY);
        make.height.mas_equalTo(60*SCALE);
        make.width.mas_equalTo(80*SCALE);
    }];
    UIButton*Completebutton = [[UIButton alloc]init];
    Completebutton.backgroundColor = qianblue;
    [Completebutton addTarget:self action:@selector(completebcilick) forControlEvents:UIControlEventTouchUpInside];
    [Completebutton setTitle:@"完成" forState:UIControlStateNormal];
    [self.view addSubview:Completebutton];
    Completebutton.layer.cornerRadius = 10*SCALE;
    Completebutton.layer.masksToBounds = YES;
    
    [Completebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-50*SCALE);
        make.height.mas_equalTo(35*SCALE);
        make.top.equalTo(button3.mas_bottom).offset(20*SCALE);
    }];
    UILabel*Tishilab = [[UILabel alloc]init];
    Tishilab.text=@"      请确保在光线充足的环境下拍摄,如果信息显示不清晰可能会导致审核不通过,敬请谅解";
    Tishilab.numberOfLines=0;
    Tishilab.textColor = [UIColor grayColor];
    Tishilab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Tishilab];
    [Tishilab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Completebutton.mas_bottom).offset(5*SCALE);
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-40*SCALE);
        make.height.mas_equalTo(40*SCALE);
        
    }];
}
-(void)cilickone{
    T= 101;
    [self fang];
    
}
-(void)cilicktwo{
    T = 102;
   [self fang];
}
-(void)cilickthree{
    T = 103;
[self fang];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fang{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self photo];
    }];
    
    UIAlertAction *xiangji = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self camera];
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:xiangji];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}


//相册
- (void)photo
{
    /**
     
     UIImagePickerControllerSourceTypePhotoLibrary ,//来自图库
     UIImagePickerControllerSourceTypeCamera ,//来自相机
     UIImagePickerControllerSourceTypeSavedPhotosAlbum //来自相册
     */
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}
//相机
- (void)camera
{
    //判断是否可以打开相机，模拟器此功能无法使用
    if (![UIImagePickerController isSourceTypeAvailable:
          
          UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"错误" message:@"没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    imagePicker.allowsEditing = YES;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:@"public.image"]) {
        
        imageViewTice = [info objectForKey:UIImagePickerControllerEditedImage];
        
        //如果是拍摄的照片
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            //保存在相册
            UIImageWriteToSavedPhotosAlbum(imageViewTice, nil, nil, nil);
        }
        
        
        if (T==101) {
            
            [button1 setImage:imageViewTice forState:UIControlStateNormal];
            _imView.hidden = YES;
            
        }else if (T==102){
            [button2 setImage:imageViewTice forState:UIControlStateNormal];
            _imView1.hidden = YES;

        }else{
            [button3 setImage:imageViewTice forState:UIControlStateNormal];
            _imView2.hidden = YES;

        }
    }
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//TODO:完成按钮
-(void)completebcilick{
    /*接口URL： http://api.sfy.95yes.cn/ashx/user.ashx
     
     参数说明
     
     名称	类型	说明	是否必填	示例	默认值
     action	string	authentication	是
     token	string	身份标识	是
     idCardNo	string	身份证号	是
     trueName	string	姓名	是
     cardFrontPic	File	身份证正面照片	是
     cardBackPic	File	身份证背面照片	是
     cardHandPic	File	手持身份证照片	是
     响应示例 异常示例
     {
     "Msg": "提交认证成功！请等待审核",
     "Success": true
     }*/
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *dicvab = @{@"action":@"authentication",@"token":tokenstr,@"idCardNo":self.stringPhoen,@"trueName":self.stringNmae};
    
   
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //接收类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",nil];
        
       [manager POST:@"http://api.sfy.95yes.cn/ashx/user.ashx" parameters:dicvab constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            //NSData *imageData = UIImageJPEGRepresentation(button2.currentImage, 1);
             NSData *dataCardFronpic = UIImageJPEGRepresentation(button1.currentImage,1);
             NSData *datacarBachpic= UIImageJPEGRepresentation(button2.currentImage,1);
             NSData *datacardHandPic = UIImageJPEGRepresentation(button3.currentImage,1);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
            
            //上传的参数(上传图片，以文件流的格式)
            [formData appendPartWithFileData:dataCardFronpic
                                    name:@"cardFrontPic"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
            
            [formData appendPartWithFileData:datacarBachpic
                                        name:@"cardBackPic"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
            [formData appendPartWithFileData:datacardHandPic
                                        name:@"cardHandPic"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            //打印下上传进度
            NSLog(@"aaaa%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //上传成功
             NSLog(@"上传的东西%@",responseObject[@"Msg"]);
            NSLog(@"上传的文件%@",responseObject[@"Success"]);
            NSLog(@"成功了%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //上传失败
            NSLog(@"失败%@",error);
        }];
        
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
