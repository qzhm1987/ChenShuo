//
//  GuideViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/25.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"


@interface GuideViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic)NSArray *guideArray;
@property (strong, nonatomic)UIButton *guideButton;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGuideUI];
    // Do any additional setup after loading the view.
}
-(void)addGuideUI{
    [self.view addSubview:self.guideScrollView];
    [self.guideScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(-20, 0, 0, 0));
    }];
    NSInteger count = self.guideArray.count;
    self.guideScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*count, SCREEN_HEIGHT);
    for (int i = 0; i<count; i++) {
        NSString *imgName =self.guideArray[i];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:IMAGE_NAME(imgName)];
        imgView.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.guideScrollView addSubview:imgView];
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    [button setTitleColor:Theme_Color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    button.layer.cornerRadius = 8.0f;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.guideScrollView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(160, 60));
    }];
    button.hidden = YES;
    self.guideButton = button;
}

-(void)btnClick:(UIButton *)button{
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setValue:@"guide" forKey:@"guide"];
    [userdefault synchronize];
    [AppDel commonTabBarRootController];
}

#pragma UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = (scrollView.contentOffset.x/SCREEN_WIDTH);
    self.guideButton.hidden = index+1<self.guideArray.count?YES:NO;
    
}
-(UIScrollView *)guideScrollView{
    if (!_guideScrollView) {
        _guideScrollView=[[UIScrollView alloc]init];
        _guideScrollView.backgroundColor=[UIColor whiteColor];
        _guideScrollView.delegate = self;
        _guideScrollView.pagingEnabled = YES;
        _guideScrollView.bounces = NO;
        _guideScrollView.showsHorizontalScrollIndicator= NO;
        _guideScrollView.showsVerticalScrollIndicator= NO;
    }
    
    return _guideScrollView;
}
-(NSArray *)guideArray{
    if (!_guideArray) {
        _guideArray = @[@"guide_1.jpg",@"guide_2.jpg",@"guide_3.jpg"];
    }
    return _guideArray;
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
