//
//  UserViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/11.
//  Copyright © 2016年 kkjr. All rights reserved.
//


#import "UserViewController.h"
#import "Masonry.h"
#import  "IdentityViewController.h"
#import "BankcardViewController.h"
#import "PaymentViewController.h"
#import "ViewController.h"
#import "SettlementViewController.h"
#import "SetUpPayViewController.h"
#import "BackViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCALE SCREEN_WIDTH/375.0


@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSArray *_ImageArray;
    NSArray *_LabArray;
    UITableView *_tableView;
    UIView *lineView;
    NSString *Abc;
    NSString *AuthenticationState;
    
    
}

@property (nonatomic,strong)UILabel *IDlab1;
@property (nonatomic,strong)UILabel *Ylab;
@property (nonatomic,strong)UILabel *Ylab1;
@property (nonatomic,strong)UILabel *Ylab2;
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,copy)NSString *payPasswstr;
@property (nonatomic,copy) NSString *tokenstr;
@property (nonatomic,strong)NSUserDefaults *userDefaults;
@property (nonatomic,copy) NSString *urlStr;


@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xianTiao];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  0,0, 0) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 45*SCALE;
    [self.view addSubview:_tableView];
    
    self.navigationController.navigationBar.barTintColor = qianblue;
    
    self.navigationItem.title = @"用户";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
       _ImageArray=@[@[@"jiesuan.png",@"shenfen.png",@"yinhang.png"],@[@"denglu.png",@"zhifu.png"],@[@"gengxin.png",@"tuichu.png"]];
    _LabArray = @[@[@"申请结算",@"身份验证",@"银行卡验证"],@[@"修改登录密码",@"支付密码"],@[@"版本更新",@"退出登录"]];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.showsVerticalScrollIndicator =
    NO;
    // _tableView.backgroundColor = [UIColor colorWithRed:247.0/225.0 green:247.0/225.0 blue:247.0/225.0 alpha:100];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@(screenHeight*4.7));
        
    }];
    
    
    self.urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    NSLog(@"%@",_urlStr);
    [self NetworkIntercede:_urlStr];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden = NO;
    
}


#pragma mark -- 网络请求
- (void)NetworkIntercede:(NSString *)strUrl   {
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    _tokenstr = [_userDefaults objectForKey:@"tokenKey"];
    
    NSDictionary *parameterdic = @{@"action":@"getUserInfo",
                          @"token":_tokenstr};
    DREAMAppLog(@"%@",parameterdic);
    [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:strUrl parameters:parameterdic success:^(id responseObject) {
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *infoDic = [NSMutableDictionary dictionaryWithJsonString:string];
        
        DREAMAppLog(@"%@",infoDic);
        
        _IDlab1.text = [NSString stringWithFormat:@"%@",infoDic[@"UserName"]];
        _Ylab.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountAvailable"]];
        _Ylab1.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountProfit"]];
        _Ylab2.text = [NSString stringWithFormat:@"%@",infoDic[@"AccountIn"]];
        NSString *str =[NSString stringWithFormat:@"%@",infoDic[@"Token"]];
        
        

        self.payPasswstr = infoDic[@"IsSetPayPassword"];
        
        [_userDefaults setObject:infoDic[@"Token"] forKey:@"tokenKey"];
        [_userDefaults synchronize];
        
        _tokenstr = [_userDefaults objectForKey:@"tokenKey"];
        

        NSString *picurl = [NSString stringWithFormat:@"%s%@",SFYSERVER,infoDic[@"AccountPic"]];
        [_headImage sd_setImageWithURL:[NSURL URLWithString:picurl] placeholderImage:nil];
        NSLog(@"%@",picurl);
        [_tableView reloadData];
    } failur:^(id error) {
        NSLog(@"%@",error);
    }];
    
    
}

-(void)xianTiao{
    //蓝色到航条
    UIView *_Naview = [[UIView alloc]init];
    [self.view addSubview:_Naview];
    
    [_Naview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(22.0);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@43.0);
    }];
    
    //用户的头像
    _headImage = [[UIImageView alloc]init];
    _headImage.image =[UIImage imageNamed:@"touxiang.png"];
    _headImage.userInteractionEnabled = YES;
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = 24 * SCALE;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handletapHead)];
    [_headImage addGestureRecognizer:tap];
    [self.view addSubview:_headImage];
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_Naview.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(screenWidth*0.08);
        make.height.equalTo(@(50*SCALE));
        make.width.equalTo(@(50*SCALE));
        
    }];
    
    //用户ID
    UILabel *IDlab = [[UILabel alloc]init];
    IDlab.text = @"ID:";
    IDlab.textColor = qianjblack;
    [self.view addSubview:IDlab];
    [IDlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImage.mas_right).offset(13*SCALE);
        make.width.equalTo(@25);
        make.height.equalTo(@20);
        make.centerY.equalTo(_headImage.mas_centerY).with.offset(0);
    }];
    _IDlab1 = [[UILabel alloc]init];
    
    _IDlab1.textColor = qianjblack;
    [self.view addSubview:_IDlab1];
    [_IDlab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(IDlab.mas_right).offset(2);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@20);
        make.centerY.equalTo(_headImage.mas_centerY).with.offset(0);
    }];
    
//     [self.rateview.logoImage sd_setImageWithURL:[NSURL URLWithString:rateM.ChannelIcon] placeholderImage:nil];
    //线条
    UIView *view =[[UIView alloc]init];
    
    lineView = view;
    view.backgroundColor =  [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        
        make.top.equalTo(_headImage.mas_bottom).offset(25*SCALE+15+3+15);
        
        make.right.equalTo(self.view.mas_right).offset(0);
        
        make.height.equalTo(@1);
    }];
    
    //上面的两个线条
    UIView *view1= [[UIView alloc]init];
    view1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview.mas_left).offset(screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@1);
        make.height.equalTo(@(33*SCALE));
    }];
    
    
    
    
    UIView *view2= [[UIView alloc]init];
    view2.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view2.superview.mas_right).offset(-screenWidth*0.33);
        make.bottom.equalTo(view.mas_bottom).offset(0);
        make.width.equalTo(@1);
        make.height.equalTo(@(33*SCALE));
    }];
    
    //三个lab
    UILabel*lab1 =[[UILabel alloc]init];
    lab1.font =[UIFont systemFontOfSize:14];
    lab1.textColor = qianjblack;
    lab1.text = @"账户余额";
    lab1.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view1.mas_right).offset(-screenWidth*0.08);
        make.top.equalTo(_headImage.mas_bottom).offset(25*SCALE);
        make.width.equalTo(@(screenWidth*0.2));
        make.height.equalTo(@(15));
    }];
    
    
    
    UILabel*lab2 =[[UILabel alloc]init];
    lab2.font =[UIFont systemFontOfSize:14];
    lab2.textColor = qianjblack;
    lab2.text = @"分润余额";
    lab2.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab1.mas_top).offset(0);
        make.width.equalTo(@(screenWidth*0.2));
        make.height.equalTo(@(15));
        make.left.equalTo(view1.mas_left).offset(screenWidth*0.06);
        
        
    }];
    
    UILabel*lab3 =[[UILabel alloc]init];
    lab3.font =[UIFont systemFontOfSize:14];
    lab3.textColor = qianjblack
    lab3.text = @"结算余额";
    lab3.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab1.mas_top).offset(0);
        make.width.equalTo(@(screenWidth*0.2));
        make.height.equalTo(@(15));
        make.left.equalTo(view2.mas_left).offset(screenWidth*0.07);
    }];
    //获取的余额
    _Ylab= [[UILabel alloc]init];
    _Ylab.text = @"88.88";
    _Ylab.font =[UIFont systemFontOfSize:14];
    _Ylab.textAlignment = UITextAlignmentCenter;
    _Ylab.textColor = qianjblack;
    [self.view addSubview:_Ylab];
    [_Ylab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(screenWidth*0.09);
        make.top.equalTo(lab1.mas_bottom).offset(3);
        make.width.mas_equalTo(50*SCALE);
        make.height.mas_equalTo(15.0*SCALE);
    }];
//    _Ylab.backgroundColor =[UIColor redColor];
    
    
    
    _Ylab1= [[UILabel alloc]init];
    _Ylab1.text = @"88.88";
    _Ylab1.font =[UIFont systemFontOfSize:14];
    _Ylab1.textAlignment = UITextAlignmentCenter;
    _Ylab1.textColor = qianjblack
    [self.view addSubview:_Ylab1];
    [_Ylab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(screenWidth*0.43);
        make.height.equalTo(@15);
        make.width.mas_equalTo(50*SCALE);

        make.top.equalTo(lab1.mas_bottom).offset(3);
        
    }];
    
    _Ylab2= [[UILabel alloc]init];
    _Ylab2.text = @"88.88";
    _Ylab2.font =[UIFont systemFontOfSize:14];
    _Ylab2.textAlignment = UITextAlignmentCenter;
    _Ylab2.textColor = qianjblack;
    [self.view addSubview:_Ylab2];
    [_Ylab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(view2.mas_right).offset(screenWidth*0.235);
        make.height.mas_equalTo(@15);
        make.width.mas_equalTo(50*SCALE);
        make.top.equalTo(lab1.mas_bottom).offset(3);
    }];
    
}

#pragma mark -- 头像
- (void)handletapHead {

    [self addAlertViewController:@""];

}
- (void)addAlertViewController:(NSString *)alertStr {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:alertStr preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self addImagePickCCamera];
        }else {
            [NSString addMBProgressHUD:@"不支持拍照" showHUDToView:self.view];
        }
    }];
    UIAlertAction *alerts = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self addImagePickCPhotosAlbum];
    }];
    UIAlertAction *alertss = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:alert];
    [alertC addAction:alerts];
    [alertC addAction:alertss];
    [self presentViewController:alertC animated:YES completion:nil];
    
    
}
// 从相机选择
- (void)addImagePickCCamera {
    //1. 创建UIImageOickerController对象 图片选择器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //2. 设置选择图片的来源 图片库
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //3. 设置代理人
    imagePicker.delegate = self;
    //4. 确定当前选择的图片是否需要剪辑
    imagePicker.allowsEditing = YES;
    //模态返回
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

// 从相册选择
- (void)addImagePickCPhotosAlbum {
    //1. 创建UIImageOickerController对象 图片选择器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //2. 设置选择图片的来源 图片库
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //3. 设置代理人
    imagePicker.delegate = self;
    //4. 确定当前选择的图片是否需要剪辑
    imagePicker.allowsEditing = YES;
    //模态返回
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -- UIImagePickerControllerDelegate**************

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"完成图片的选择");
    //取出编辑之后的图片
    UIImage *editeImage = info[@"UIImagePickerControllerEditedImage"];
    _headImage.image = editeImage;

    [self imageUpload:_headImage.image];
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"取消图片的选择");
    //返回上一界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imageUpload:(UIImage *)image {
    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
    NSLog(@"上传文件 %@",urlStr);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    // png
    //NSData *data = UIImagePNGRepresentation(image);
    // JPG
    NSData *dataimage = UIImageJPEGRepresentation(image,0.7);
    
    // 可以在上传时使用当前的系统时间作为文件名(解决重名)
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
    NSDictionary *dataDic = @{@"action":@"updateAvatar",
                          @"token":_tokenstr,
                          @"Avatar":dataimage};
    
    //DREAMAppLog(@"%@",dataDic);
    [manager POST:urlStr parameters:dataDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:dataimage name:@"Avatar" fileName:fileName mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"Success"] integerValue] == 1) {
            DREAMAppLog(@"修改 %@",responseObject[@"Msg"]);
            
            
        }else {
            DREAMAppLog(@"修改不成功 %@",responseObject[@"Msg"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DREAMAppLog(@"%@",error);

    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }
    else if(section==1)
    {
        return 2;
    }
    else if (section==2){
        return 2;
    }
    else{
        
        return 0;
    }
}

//TODO:线条未实现
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellIdentfier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentfier];
        UIView *view2 =[[UIView alloc]initWithFrame:CGRectMake(0, 45*SCALE,SCREEN_WIDTH, 0.5)];
        view2.backgroundColor =  [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
        view2.tag = 2015;
        [cell.contentView addSubview:view2];
        if (indexPath.row==0||indexPath.row==3||indexPath.row==5) {
            UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 1)];
            view1.backgroundColor = [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100];
            [cell.contentView addSubview:view1];
        }
    }
    
    UIImageView *cellImageView = [[UIImageView alloc]init];
    cellImageView.image = [UIImage imageNamed:@"danyuangeaa.png"];
    [cell.contentView addSubview:cellImageView];
    [cellImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*SCALE);
        make.right.mas_equalTo(cell.contentView.mas_right).offset(-20*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(10*SCALE);
    }];
    if (indexPath.section==0&&indexPath.row==1) {
        UILabel *celltext = [[UILabel alloc]init];
        celltext.text =AuthenticationState;
        celltext.textColor = qianjblack;
        celltext.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:celltext];
        [celltext mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5*SCALE);
            make.right.mas_equalTo(cell.contentView.mas_right).offset(-40*SCALE);
            make.width.mas_equalTo(80*SCALE);
            make.height.mas_equalTo(40*SCALE);
            
        }];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textColor = qianjblack;
    cell.textLabel.text =[_LabArray objectAtIndex:indexPath.section][indexPath.row];
    cell.imageView.image = nil;
    cell.imageView.image = [UIImage imageNamed:[_ImageArray objectAtIndex:indexPath.section][indexPath.row]];
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section>=3) {
        return 140;
    }
    
    return 20;
}

//单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController*vc= nil;
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                vc = [[SettlementViewController alloc]init];
                break;
            case 1:
                
                vc = [[IdentityViewController alloc]init];
                break;
            case 2:
                vc = [[BankcardViewController alloc]init];
                break;
            default:
                break;
        }
    }
    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0:
                vc = [[BackViewController alloc]init];
                break;
            case 1:
                if ([self.payPasswstr integerValue] == 0) {
                    NSString *urlStr = [NSString stringWithFormat:@"%s%s",SFYSERVER,SFYLOGON];
                    
                    SetUpPayViewController *setupPayVC = [[SetUpPayViewController alloc]init];
                    setupPayVC.navtitStr = @"支付密码";
                    setupPayVC.urlstr = urlStr;
                    setupPayVC.actionstr = @"setPayPassword";
                    setupPayVC.numberStr = @"setPayPassword_sendsms";
                    
                    [self.navigationController pushViewController:setupPayVC animated:YES];
                    return;
                }else {
                    vc = [[PaymentViewController alloc]init];
                    
                }
                
                break;
            default:
                break;
        }
    }
    if (indexPath.section==2&&indexPath.row==1) {
        
        ViewController *vi = [[ViewController alloc]init];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vi];
        
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定退出" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            NSDictionary *parameterdic = @{@"action":@"logout",
                                           @"token":_tokenstr};
            
            //DREAMAppLog(@"%@",parameterdic);
            [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:_urlStr parameters:parameterdic success:^(id responseObject) {
                DREAMAppLog(@"退出 %@",responseObject);
                if ([responseObject[@"Success"] integerValue] == 1) {
                    
                    [self presentViewController:nav animated:NO completion:nil];
                    
                }
                
            } failur:^(id error) {
                
            }];
            
        }];
        
        UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:alert];
        [alertC addAction:alert2];
        
        [self presentViewController:alertC animated:YES completion:nil];
        
        
        
        return;
    }
    
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
