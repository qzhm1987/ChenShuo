//
//  RegisterViewController.m
//  XiaoMenTong
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 BeiJingXiaoMenTong. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"用户注册";
    UILabel *label_r = [UILabel new];
    label_r.text = @"登录";
    label_r.textAlignment = NSTextAlignmentRight;
    label_r.font = [UIFont systemFontOfSize:20.0f];
    [self.view addSubview: label_r];
    [ label_r mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(getRectNavAndStatusHight-40);
        make.right.equalTo(self.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 45));
    }];
    
    label_r.userInteractionEnabled = YES;
    UITapGestureRecognizer  *regTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginClick:)];
    [label_r addGestureRecognizer:regTap];
    
    
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor darkGrayColor];
    label.text = @"立即注册";
    label.font = [UIFont systemFontOfSize:25.0f];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(getRectNavAndStatusHight);
        make.left.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 45));
    }];
    
    
    
    
    
    [self registerCreateUIWithMasonry];
    
    // Do any additional setup after loading the view.
}

-(void)registerCreateUIWithMasonry{
    NSArray *lableArr = @[@"手机:",@"密码:",@"验证码:"];
    NSArray *placeArr = @[@"手机号/账号",@"密码",@"验证码"];
    for (NSInteger i =0; i<2; i++) {
        UILabel *lable = [UILabel new];
        lable.text = lableArr[i];
        lable.textColor = [UIColor lightGrayColor];
        [self.view addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(120+i*80);
            make.left.equalTo(self.view).offset(20);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        UIView *line = [UIView new];
        line.backgroundColor =  [UIColor lightGrayColor];
        [self.view addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lable.mas_bottom).offset(1);
            make.left.equalTo(lable);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, 1));
        }];
        UITextField *textField = [[UITextField alloc]init];
        textField.borderStyle = UITextBorderStyleNone;
        textField.placeholder = placeArr[i];
        textField.tag = 20+i;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.delegate = self;
        [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self.view addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(lable);
            make.left.equalTo(lable.mas_right);
            make.right.equalTo(line);
        }];
        if (i==1) {
            UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [loginBtn setTitle:@"立即注册" forState:UIControlStateNormal];
            loginBtn.layer.cornerRadius = 6;
            loginBtn.backgroundColor = Theme_Color;
            [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            loginBtn.tag = 11;
            [self.view addSubview:loginBtn];
            
            [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(line).offset(80);
                make.left.right.equalTo(line);
                make.height.mas_equalTo(47);
            }];
        }
    }
    
    
    
    
    
    //for 循环结束
    _phoneNumTF = (UITextField *)[self.view viewWithTag:20];
    _passwordTF = (UITextField *)[self.view viewWithTag:21];
    _passwordTF.secureTextEntry = YES;//密码小圆点
    _verifyCodeTF = (UITextField *)[self.view viewWithTag:22];
    
    
   
}

-(void)loginClick:(UITapGestureRecognizer *)gesture{
    [self.navigationController popViewControllerAnimated:YES];
    
}



/**
 按钮点击事件
 * @ param button 点击的button
 @ return
 */
-(void)btnClick:(UIButton *)button {
    if (_phoneNumTF.text.length<11) {
        [self.view makeToast:@"请输入正确的手机号"];
        return;
    }
    if (_passwordTF.text.length<6) {
       [self.view makeToast:@"密码长度不得小于6位"];
        return;
    }
    else{
        [self registerUserRequest];//注册用户
    }
}

/**
 获取验证码
 *
 @ return
 */
-(void)getRegisterCode {
    
}

-(void)registerUserRequest {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:_passwordTF.text forKey:_phoneNumTF.text];
    [userDefault setObject:_phoneNumTF.text forKey:@"phone"];
    [self.view makeToast:@"注册成功"];
    [self performSelector:@selector(goMain) withObject:nil afterDelay:3];
}


-(void)goMain {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma Mark TextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.returnKeyType = UIReturnKeyJoin;
    if (textField.tag==20||textField.tag==22){
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else{
        textField.keyboardType = UIKeyboardTypeASCIICapable;
    }
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    
    if (textField.tag==20) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
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
