//
//  PassWordTextView.m
//  TextFieldTest
//
//  Created by Tpphha on 15/12/16.
//  Copyright © 2015年 Tpphha. All rights reserved.
//

#import "TPPasswordTextView.h"

#define customHigth 30
#define customWidth 30

@interface TPPasswordTextView ()<UITextFieldDelegate>
@property(nonatomic, weak) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
@implementation TPPasswordTextView

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:self.elementCount];
    }
    return _dataSource;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGPoint center = self.center;
        
        self.backBut = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backBut.frame = CGRectMake(10, 15, customWidth, customWidth);
        [self.backBut setImage:[UIImage imageNamed:@"zuojiantou@2x"] forState:UIControlStateNormal];
        [self.backBut addTarget:self action:@selector(handlebackbut) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backBut];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 15, 80, 16)];
        label.center = CGPointMake( center.x, self.backBut.center.y);
        label.text = @"输入密码";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = qianjblack;
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:label];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 55, 667, 1)];
        view.backgroundColor = qiangrayColor;
        [self addSubview:view];

        UIButton *passbut = [UIButton buttonWithType:UIButtonTypeCustom];
        passbut.frame = CGRectMake(screenWidth - 100, 115, 100, 30);
        [passbut setTitle:@"忘记密码" forState:UIControlStateNormal];
        [passbut setTitleColor:[UIColor colorWithRed:204 / 255.0 green:204 / 255.0 blue:204 / 255.0 alpha:1.0] forState:UIControlStateNormal];
        passbut.titleLabel.font = [UIFont systemFontOfSize:14];
        [passbut addTarget:self action:@selector(passbutAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:passbut];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:self.bounds];
        textField.hidden = YES;
        textField.delegate = self;
        textField.layer.borderWidth = 1;

        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:textField];
        self.textField = textField;
    }
    return self;
}
- (void)backbutton:(ButtonBlock)block {
    self.butback = block;
}

- (void)handlebackbut {
    if (self.butback) {
        self.butback();
    }
    [self.textField resignFirstResponder];//返回隐藏键盘
}

- (void)passbutton:(PassButtonBlock)block {
    self.passbut = block;
}

- (void)passbutAction {
    if (self.passbut) {
        self.passbut();
    }
}
- (void)setElementCount:(NSUInteger)elementCount {
    _elementCount = elementCount;
    for (int i = 0; i < self.elementCount; i++)
    {
        UITextField *pwdTextField = [[UITextField alloc] init];
        pwdTextField.layer.borderColor = [UIColor colorWithRed:204 / 255.0 green:204 / 255.0 blue:204 / 255.0 alpha:1.0].CGColor;
        pwdTextField.enabled = NO;
        pwdTextField.textAlignment = NSTextAlignmentCenter;//居中
        pwdTextField.secureTextEntry = YES;//设置密码模式
        pwdTextField.layer.borderWidth = 1;
        pwdTextField.userInteractionEnabled = NO;
        [self insertSubview:pwdTextField belowSubview:self.textField];
        [self.dataSource addObject:pwdTextField];
    }
}

- (void)setElementColor:(UIColor *)elementColor {
    _elementColor = elementColor;
    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        UITextField *pwdTextField = [_dataSource objectAtIndex:i];
        pwdTextField.layer.borderColor = self.elementColor.CGColor;
    }
}


- (void)setElementMargin:(NSUInteger)elementMargin {
    _elementMargin = elementMargin;
    [self setNeedsLayout];
}

- (void)clearText {
    self.textField.text = nil;
    [self textChange:self.textField];
}

#pragma mark - 文本框内容改变
- (void)textChange:(UITextField *)textField {
    
    NSString *password = textField.text;
    if (password.length > self.elementCount) {
        return;
    }
    
    for (int i = 0; i < _dataSource.count; i++)
    {
        UITextField *pwdTextField= [_dataSource objectAtIndex:i];
        if (i < password.length) {
            NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            pwdTextField.text = pwd;
        } else {
            pwdTextField.text = nil;
        }
        
    }
    
    if (password.length == _dataSource.count)
    {
        [textField resignFirstResponder];//隐藏键盘
    }
    
    !self.passwordBlock ? : self.passwordBlock(textField.text);

}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = (self.bounds.size.width - (self.elementCount - 1) * self.elementMargin) / self.elementCount- 7;
    CGFloat h = self.bounds.size.height;
    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        UITextField *pwdTextField = [_dataSource objectAtIndex:i];
        x = i * (w + self.elementMargin);
        pwdTextField.frame = CGRectMake(x+20, y + 65, w, h - 350);
        
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField becomeFirstResponder];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
