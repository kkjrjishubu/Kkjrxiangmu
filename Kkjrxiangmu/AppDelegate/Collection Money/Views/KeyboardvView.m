
//
//  KeyboardvView.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/12.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "KeyboardvView.h"

@implementation KeyboardvView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *viewtext = [[UIView alloc]initWithFrame:CGRectMake(15, 20, screenWidth - 30, 120)];
        viewtext.backgroundColor = qiangrayColor;
        
        self.labelText = [[UILabel alloc]initWithFrame:CGRectMake(1, 1, viewtext.frame.size.width - 2, viewtext.frame.size.height - 2)];
        self.labelText.backgroundColor = [UIColor whiteColor];
        self.labelText.text = @"0";
        self.labelText.textColor = qianjblack;
        self.labelText.textAlignment = NSTextAlignmentRight;
        self.labelText.numberOfLines = 0;
        self.labelText.font = [UIFont systemFontOfSize:40];
        
        [viewtext addSubview:self.labelText];
        [self addSubview:viewtext];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, viewtext.frame.origin.y + viewtext.frame.size.height + 20, viewtext.frame.size.width - 2, 12)];
        //label.backgroundColor = [UIColor redColor];
        label.text = @"提示:请输入收款金额选择收款方式完成收款";
        label.textColor = qiangrayColor;
        //label.textAlignment = NSTextAlignmentRight;
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        
        //创建自定义的键盘
        _keyBorder = [[UIView alloc] initWithFrame:CGRectMake(15, [UIScreen mainScreen].bounds.size.height - 475, [UIScreen mainScreen].bounds.size.width - 30, 345)];
        _keyBorder.backgroundColor = qiangrayColor;
        //设置用户名自定义的键盘
        //_userNameText.inputView = _keyBorder;
        
        
        NSArray *arr = @[@[@"1",@"2",@"3"],@[@"4",@"5",@"6"],@[@"7",@"8",@"9"],@[@".",@"0",@"00"]];
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3 ; j++) {
                //设置自定义键盘上的按钮
                UIButton *_numberButton = [ UIButton buttonWithType:UIButtonTypeRoundedRect];
                _numberButton.frame = CGRectMake(1 + (86 + 1) * j, 1 + (85 + 1) * i, 86, 85);
                _numberButton.backgroundColor = [UIColor whiteColor];
                //设置键盘上按钮的数字颜色
                [_numberButton setTitleColor:[UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
                [_numberButton setTitle:arr[i][j] forState:UIControlStateNormal];
                [_keyBorder addSubview:_numberButton];
                //将第四行第一列设置为 ✔️
                if (i == 3 && j ==0) {
                    //点击✔️时相应的事件
                    [_numberButton addTarget:self action:@selector(numberDoneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                }
                //将第四行第三列设置为🔙
                else if(i == 3 && j ==2 ){
                    //点击🔙时的响应事件
                    [_numberButton addTarget:self action:@selector(numberBackSpaceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                }
                else{
                    //点击 1 -- 9 这九个按钮相应的方法  响应的时间可以和点击0时响应的事件一样
                    [_numberButton addTarget:self action:@selector(numberButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                }
                
                
                
            }
        }
        
        
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake((_keyBorder.frame.size.width - 83), 1, 82, 171);
        [but setTitleColor:[UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
        but.backgroundColor = [UIColor whiteColor];
        [but setImage:[UIImage imageNamed:@"chexiao@2x"] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(butcancelaction:) forControlEvents:UIControlEventTouchUpInside];
        [_keyBorder addSubview:but];
        
        
        UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
        but1.frame = CGRectMake((_keyBorder.frame.size.width - 83), 173, but.frame.size.width, but.frame.size.height);
        [but1 setTitleColor:[UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
        but1.backgroundColor = [UIColor whiteColor];
        [but1 setTitle:@"确定" forState:UIControlStateNormal];
        [but1 addTarget:self action:@selector(butsureAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_keyBorder addSubview:but1];
        
        [self addSubview:_keyBorder];

    }
    return self;
}

//改变button的显示的字符串 （随机改变验证码）
- (void)changeString:(UIButton *)sender{
    int a = arc4random()%9000+1000;
    NSString *_testString = [NSString stringWithFormat:@"%d",a];
    //将随机出来的数字添加到button上
    [sender setTitle:_testString forState:UIControlStateNormal];
    //同时改变button的颜色
    sender.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0  blue:arc4random() % 256 / 255.0  alpha:.8];
}

- (void)numberDoneButtonAction:(UIButton *)sender {
    NSLog(@"点");
}

- (void)numberBackSpaceButtonAction:(UIButton *)sender {
    NSLog(@"00");
}

- (void)numberButtonAction:(UIButton *)sender {
    NSLog(@"数字");
    
    if ([sender.titleLabel.text  isEqual: @"0"]) {
        NSLog(@"0");
    }else if ([sender.titleLabel.text  isEqual: @"1"]) {
        NSLog(@"1");
    }else if ([sender.titleLabel.text  isEqual: @"2"]) {
        NSLog(@"2");
    }else if ([sender.titleLabel.text  isEqual: @"3"]) {
        NSLog(@"3");
    }else if ([sender.titleLabel.text  isEqual: @"4"]) {
        NSLog(@"4");
    }else if ([sender.titleLabel.text  isEqual: @"5"]) {
        NSLog(@"5");
    }else if ([sender.titleLabel.text  isEqual: @"6"]) {
        NSLog(@"6");
    }else if ([sender.titleLabel.text  isEqual: @"7"]) {
        NSLog(@"7");
    }else if ([sender.titleLabel.text  isEqual: @"8"]) {
        NSLog(@"8");
    }else if ([sender.titleLabel.text  isEqual: @"9"]) {
        NSLog(@"9");
    }
    
    
    
}

- (void)butcancelaction:(UIButton *)sener {
    NSLog(@"取消");
}

- (void)butsureAction:(UIButton *)sener {
    NSLog(@"确定");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
