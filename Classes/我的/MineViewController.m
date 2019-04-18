//
//  MineViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "MineViewController.h"
#import <Masonry.h>

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"我的";
    
    /*
    self.navigationController.navigationBar.hidden = YES;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(84);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"首页";
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(view);
        make.height.mas_equalTo(34);
    }];
    */
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
