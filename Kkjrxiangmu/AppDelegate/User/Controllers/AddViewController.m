//
//  AddViewController.m
//  Kkjrxiangmu
//
//  Created by 贾增辉 on 16/8/16.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "AddViewController.h"
#import "YhangkaViewController.h"
#import "modelTool.h"
#import "UserViewController.h"
#define SCALE screenWidth/375.0

@interface AddViewController ()
{
    UITextField *textField2;
    NSString *nameNumber;
    UITextField *textField3;
    //市
    NSString *CityString;
    //截取字符串数组
    NSArray *Stringarray;
    //省
    NSString *provinceString;
    
    UITextField *textField1;
    
    UITextField *textField5;
    
    UITextField *textField4;
    
    UITextField *textField6;
}
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =backViewColor;
    self.navigationItem.title = @"银行卡添加";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Block@2x(1)"] style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    

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
    
    UILabel *YHKAlab = [[UILabel alloc]init];
    YHKAlab.text = @"银行卡号";
    YHKAlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:YHKAlab];
    [YHKAlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(lab.mas_bottom).offset(20*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    UIView *_xianView = [[UIView alloc]init];
    _xianView.backgroundColor = xianClole;
    [self.view addSubview:_xianView];
    [_xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(YHKAlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *SYHlab = [[UILabel alloc]init];
    SYHlab.text = @"所属银行";
    SYHlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SYHlab];
    [SYHlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(YHKAlab.mas_centerX);
        make.top.equalTo(YHKAlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    
    UILabel *SFlab = [[UILabel alloc]init];
    SFlab.text = @"银行省份";
    SFlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SFlab];
    [SFlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SYHlab.mas_centerX);
        make.top.equalTo(SYHlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];

    UIView *_xianView1 = [[UIView alloc]init];
    _xianView1.backgroundColor = xianClole;
    [self.view addSubview:_xianView1];
    [_xianView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SYHlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];

    UILabel *KHlab = [[UILabel alloc]init];
    KHlab.text = @"开户支行";
    KHlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:KHlab];
    [KHlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SYHlab.mas_centerX);
        make.top.equalTo(SFlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(90*SCALE);
    }];
    
    UIView *_xianView2 = [[UIView alloc]init];
    _xianView2.backgroundColor = xianClole;
    [self.view addSubview:_xianView2];
    [_xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SFlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *SKlab = [[UILabel alloc]init];
    SKlab.text = @"开户人姓名";
    SKlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:SKlab];
    [SKlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(KHlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(85*SCALE);
    }];
    
    UIView *_xianView3 = [[UIView alloc]init];
    _xianView3.backgroundColor = xianClole;
    [self.view addSubview:_xianView3];
    [_xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(KHlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *YLlab = [[UILabel alloc]init];
    YLlab.text = @"预留手机号";
    YLlab.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:YLlab];
    [YLlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40*SCALE);
        make.top.equalTo(SKlab.mas_bottom).offset(40*SCALE);
        make.height.mas_equalTo(20*SCALE);
        make.width.mas_equalTo(85*SCALE);
    }];
    
    UIView *_xianView4 = [[UIView alloc]init];
    _xianView4.backgroundColor = xianClole;
    [self.view addSubview:_xianView4];
    [_xianView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(SKlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
    
    UIView *_xianView5 = [[UIView alloc]init];
    _xianView5.backgroundColor = xianClole;
    [self.view addSubview:_xianView5];
    [_xianView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(YLlab.mas_bottom).offset(20*SCALE);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(1);
    }];
//TODO:输入框
    textField1 = [[UITextField alloc]init];
    textField1.placeholder = @"请输入正确的银行卡号";
    textField1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField1];
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(YHKAlab.mas_centerY);
        make.left.equalTo(YHKAlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    textField2 = [[UITextField alloc]init];
    textField2.placeholder = @"工商银行";
    textField2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField2];
    [textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SYHlab.mas_centerY);
        make.left.equalTo(SYHlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    
    textField3 = [[UITextField alloc]init];
    textField3.placeholder = @"河南 郑州市";
    textField3.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField3];
    [textField3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SFlab.mas_centerY);
        make.left.equalTo(SFlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];

    textField4 = [[UITextField alloc]init];
    textField4.placeholder = @"如xx分行xx支行";
    textField4.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField4];
    [textField4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(KHlab.mas_centerY);
        make.left.equalTo(KHlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    

    textField5 = [[UITextField alloc]init];
    textField5.placeholder = @"银行卡姓名";
    textField5.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField5];
    [textField5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(SKlab.mas_centerY);
        make.left.equalTo(SKlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    textField6 = [[UITextField alloc]init];
    textField6.placeholder = @"银行预留手机号";
    textField6.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textField6];
    [textField6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(YLlab.mas_centerY);
        make.left.equalTo(YLlab.mas_right).offset(0*SCALE);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = qianblue;
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    
    [button addTarget:self action:@selector(cilick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_xianView5.mas_bottom).offset(30*SCALE);
        make.left.equalTo(self.view.mas_left).offset(60*SCALE);
        make.right.equalTo(self.view.mas_right).offset(-60*SCALE);
        make.height.mas_equalTo(SCALE*40);
    }];
    
    
}
-(void)cilick{
    if (textField1.text.length==0||textField2.text.length==0||textField3.text.length==0||textField4.text.length==0||textField5.text.length==0||textField6.text.length==0) {
        [NSString addMBProgressHUD:@"请完善信息" showHUDToView:self.view];
        return;
    }
    
//TODO:输出的银行数值（nsstring）
    NSDictionary *dic = @{@"action":@"bankType"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://api.sfy.95yes.cn/ashx/Enum.ashx" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // NSLog(@"成功   %@",responseObject);
        
        NSDictionary *strDic = [NetWorkHelper dataToDictionary:responseObject];
        
        NSArray *Array=strDic[@"DataList"];
       // NSLog(@"%@",Array);
        modelTool *tellArray = [[modelTool alloc]init];
       nameNumber = [tellArray getBankValue:Array bankString:textField2.text];
        
        NSDictionary *cityDic = @{@"action":@"getProvince"};
        [[NetWorkHelper shareNetWorkEngine] PostResponseNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/Enum.ashx" parameters:cityDic success:^(id responseObject) {
            NSDictionary *strDic = [NetWorkHelper dataToDictionary:responseObject];
            
            NSArray *Array=strDic[@"DataList"];
            
            NSString *str = textField3.text;
            Stringarray = [str componentsSeparatedByString:@" "];
            NSString *s =Stringarray[0];
            NSLog(@"%@",s);
            modelTool *Tool = [[modelTool alloc]init];
            provinceString = [Tool getBAnkeVacer:Array bankSing:s];
            NSLog(@"aaaaaaa%@",provinceString);
            //城市
            NSDictionary *CityCode =@{@"action":@"getCity",@"cityCode":provinceString};
            [[NetWorkHelper shareNetWorkEngine]PostResponseNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/Enum.ashx" parameters:CityCode success:^(id responseObject) {
                NSDictionary *strDic = [NetWorkHelper dataToDictionary:responseObject];
                // NSLog(@"str %@",strDic);
                NSArray *Array=strDic[@"DataList"];
                CityString = [Tool getBAnkeVacer:Array bankSing:Stringarray[1]];
                NSLog(@"%@",CityString);
                
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                NSString *tokenstr = [userDefaults objectForKey:@"tokenKey"];
                //Vale
                NSNumber *num = @([nameNumber intValue]);
                //provinceString
                NSNumber *provinceNum = @([provinceString intValue]);
                //CityString
                NSNumber *CityNum=@([CityString intValue]);
                
                NSDictionary *TianjiaDic = @{@"action":@"add",@"token":tokenstr,@"BankType":num,@"BankNo":textField1.text,@"Owner":textField5.text,@"BankProvince":provinceNum,@"BankCity":CityNum,@"Branch":textField4.text,@"Mobile":textField6.text};
                
                
                [[NetWorkHelper shareNetWorkEngine] PostRequestNetInfoWithURLStrViaNet:@"http://api.sfy.95yes.cn/ashx/BankCard.ashx" parameters:TianjiaDic success:^(id responseObject) {
                    NSLog(@"%@",responseObject[@"Msg"]);
                    
                    NSString *tonkenarystr = responseObject[@"Token"];
                    [userDefaults setObject:tonkenarystr forKey:@"tokenKey"];
                    [NSString addMBProgressHUD:responseObject[@"Msg"] showHUDToView:self.view];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                } failur:^(id error) {
                    NSLog(@"%@",error);
                }];
                
                
                
            } failur:^(id error) {
                
            }];
            
        } failur:^(id error) {
            NSLog(@"1111111%@",error);
        }];
        

    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败 %@",error);
        
    }];
    
     
    
    
}
-(void)backAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
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
