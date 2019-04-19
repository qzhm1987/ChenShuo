//
//  MainViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    AVUser *user = [AVUser user];
    user.username = @"Tom";
    user.password =  @"12345678";
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // 获取 RESTAPI 返回的错误信息详情（SDK 11.0.0 及以上的版本适用）
        if ([error.domain isEqualToString:kLeanCloudErrorDomain] && error.code == 202) {
            NSString *errorMessage = error.localizedFailureReason;
            if (errorMessage) {
                // 处理错误信息
                NSLog(@"error = %@",errorMessage);
            }
        }
    }];
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
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
