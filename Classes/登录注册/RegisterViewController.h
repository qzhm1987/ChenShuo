//
//  RegisterViewController.h
//  XiaoMenTong
//
//  Created by Mac on 2017/8/9.
//  Copyright © 2017年 BeiJingXiaoMenTong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RegisterViewController : UIViewController<UITextFieldDelegate>


@property (nonatomic ,strong) UITextField *phoneNumTF;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UITextField *verifyCodeTF;
@end
