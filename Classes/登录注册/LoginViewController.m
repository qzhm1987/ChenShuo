//
//  LoginViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/22.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)addLoginUI{
    UILabel *label = [UILabel new];
    label.text = @"密码登录";
    [self.view addSubview:label];
    
    
    
    
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
