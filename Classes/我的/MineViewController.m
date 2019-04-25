//
//  MineViewController.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@property (strong, nonatomic)UIButton *button;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"我的";
   
    
    [self addUserInfoView];
    [self addMessageReportView];
    [self addSettingsView];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.layer.cornerRadius = 8.0f;
    _button.backgroundColor = Theme_Color;
    [_button setTitle:@"退出登录" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_button addTarget:self action:@selector(loginOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-50, 44));
    }];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)loginOut:(UIButton *)button{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"phone"];
    [userDefault synchronize];
    [AppDel commonTabBarRootController];
    
}

-(void)addUserInfoView{
   
    UIView *infoView = [[UIView alloc]init];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(110*PIX);
    }];
    UIImageView *head = [UIImageView new];
    head.image = IMAGE_NAME(@"img_hp");
    [infoView addSubview:head];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.left.equalTo(infoView).offset(20);
        make.size.mas_equalTo(CGSizeMake(65*PIX,65*PIX));
    }];
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"昵称：Hahah";
    [infoView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head.mas_right).offset(10);
        make.top.equalTo(head).offset(0);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    UILabel *phoneLabel = [UILabel new];
    phoneLabel.textColor = [UIColor lightGrayColor];
    phoneLabel.text = @"手机号:159****6235";
    [infoView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head.mas_right).offset(10);
        make.top.equalTo(head).offset(30);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    UIImageView *arrow = [UIImageView new];
    arrow.image = IMAGE_NAME(@"btn_right");
    [infoView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.right.equalTo(infoView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    
}
-(void)addMessageReportView{
    UIView *infoView = [[UIView alloc]init];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2+110*PIX+10);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(55*PIX);
    }];
    UIImageView *head = [UIImageView new];
    head.image = IMAGE_NAME(@"img_fdback");
    [infoView addSubview:head];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.left.equalTo(infoView).offset(20);
        make.size.mas_equalTo(CGSizeMake(35*PIX,35*PIX));
    }];
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"意见反馈";
    [infoView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head.mas_right).offset(10);
        make.centerY.equalTo(infoView);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
   
    UIImageView *arrow = [UIImageView new];
    arrow.image = IMAGE_NAME(@"btn_right");
    [infoView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.right.equalTo(infoView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    infoView.tag = 10;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [infoView addGestureRecognizer:tap];
    
    
}

-(void)addSettingsView{
    UIView *infoView = [[UIView alloc]init];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2+110*PIX+10+55*PIX+2);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(55*PIX);
    }];
    UIImageView *head = [UIImageView new];
    head.image = IMAGE_NAME(@"img_setup");
    [infoView addSubview:head];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.left.equalTo(infoView).offset(20);
        make.size.mas_equalTo(CGSizeMake(35*PIX,35*PIX));
    }];
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"清理缓存";
    [infoView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head.mas_right).offset(10);
        make.centerY.equalTo(infoView);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    
    UIImageView *arrow = [UIImageView new];
    arrow.image = IMAGE_NAME(@"btn_right");
    [infoView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.right.equalTo(infoView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    infoView.tag =11;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [infoView addGestureRecognizer:tap];
    
    
}

-(void)addTelOrder{
    
    UIView *infoView = [[UIView alloc]init];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2+110*PIX+10+55*PIX+2);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(55*PIX);
    }];
    UIImageView *head = [UIImageView new];
    head.image = IMAGE_NAME(@"img_tel");
    [infoView addSubview:head];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.left.equalTo(infoView).offset(20);
        make.size.mas_equalTo(CGSizeMake(35*PIX,35*PIX));
    }];
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"电话预定";
    [infoView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(head.mas_right).offset(10);
        make.centerY.equalTo(infoView);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    
    UIImageView *arrow = [UIImageView new];
    arrow.image = IMAGE_NAME(@"btn_right");
    [infoView addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(infoView);
        make.right.equalTo(infoView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    infoView.tag =12;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [infoView addGestureRecognizer:tap];
}

-(void)tapClick:(UITapGestureRecognizer *)gesture{
    switch (gesture.view.tag) {
        case 10:
        {
            UIViewController *idea = [NSClassFromString(@"IdeaViewController" ) new];
            [self.navigationController pushViewController:idea animated:YES];
        }
            break;
        case 11:
        {
            [self.view showHUDWithMessage:@"正在清理缓存数据"];
            [self performSelector:@selector(show) withObject:nil afterDelay:3];
        }
        case 12:
        {
            NSString *telephoneNumber=@"0311-8628975";
            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",telephoneNumber];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
            
            break;
        default:
            break;
    }
    
}


-(void)show {
    [self.view hideHUD];
    [self.view makeToast:@"已经清理图片缓存"];
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
