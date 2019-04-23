//
//  MainViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()
@property (strong, nonatomic)UIScrollView *scrollView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"首页";
    [self addMainUI];
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}


-(void)addMainUI{
    UIImageView *banner = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_banner"]];
    [self.view addSubview:banner];
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(378/2.0f);
    }];
    
    
    
    
}


-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.showsHorizontalScrollIndicator= NO;
        _scrollView.showsVerticalScrollIndicator= NO;
    }
    return _scrollView;
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
