//
//  AppDelegate+Chen.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "AppDelegate+Chen.h"



#define Theme_Color [UIColor colorWithRed:255.0f/255.0 green:67.0f/255.0 blue:108.0f/255.0 alpha:1.0f]

@implementation AppDelegate (Chen)

#pragma mark Public method

-(void)goMainWindowRootController{
    UIViewController *main = [NSClassFromString(@"MainViewController") new];
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:main];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance]  setTranslucent:NO];
    [[UINavigationBar appearance]  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.window setRootViewController:mainNav];
}


-(void)commonTabBarRootController{
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    UIViewController *main  = [NSClassFromString(@"MainViewController") new];
    UINavigationController *mainNav =[[UINavigationController alloc]initWithRootViewController:main];
    UIViewController *second = [NSClassFromString(@"UIViewController") new];
    second.view.backgroundColor = [UIColor whiteColor];
    second.navigationItem.title = @"订单";
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:second];
    
   
    
    
    UIViewController  *mine = [NSClassFromString(@"MineViewController") new];
    UINavigationController *mineNav  = [[UINavigationController alloc]initWithRootViewController:mine];
    mainNav.tabBarItem.title = @"首页";
    secondNav.title = @"订单";
    mineNav.tabBarItem.title = @"我的";
    
    mainNav.tabBarItem.image = [UIImage imageNamed:@"tab_home_nor"];
    mainNav.tabBarItem.selectedImage =[[UIImage imageNamed:@"tab_home_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    secondNav.tabBarItem.image = [UIImage imageNamed:@"tab_order_nor"];
    secondNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_order_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    mineNav.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    mineNav.tabBarItem.selectedImage =[[UIImage imageNamed:@"tab_me_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabBar.viewControllers = @[mainNav,secondNav,mineNav];
    
  
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UINavigationBar appearance]  setTranslucent:NO];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :Theme_Color ,NSFontAttributeName : [UIFont systemFontOfSize:15.0]} forState:UIControlStateSelected];//TabBarItem选中时的字体颜色和大小
    
    
   self.window.rootViewController = tabBar;
}

-(void)AddButtonTabBarRootController{
    UIViewController *main = [NSClassFromString(@"MainViewController") new];
    UINavigationController *mainNav =[[UINavigationController alloc]initWithRootViewController:main];
    UIViewController *second = [NSClassFromString(@"UIViewController") new];
    UINavigationController *secondNav =[[UINavigationController alloc]initWithRootViewController:second];
    UIViewController *third = [NSClassFromString(@"UIViewController") new];
    UINavigationController *thirdNav =[[UINavigationController alloc]initWithRootViewController:third];
    UIViewController *mine = [NSClassFromString(@"MineViewController") new];
    UINavigationController *mineNav =[[UINavigationController alloc]initWithRootViewController:mine];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    tabBarController.viewControllers = @[mainNav, secondNav, thirdNav, mineNav];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"同城", kLLTabBarItemAttributeNormalImageName : @"mycity_normal", kLLTabBarItemAttributeSelectedImageName : @"mycity_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"发布", kLLTabBarItemAttributeNormalImageName : @"post_normal", kLLTabBarItemAttributeSelectedImageName : @"post_normal", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
                                    @{kLLTabBarItemAttributeTitle : @"消息", kLLTabBarItemAttributeNormalImageName : @"message_normal", kLLTabBarItemAttributeSelectedImageName : @"message_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"我的", kLLTabBarItemAttributeNormalImageName : @"account_normal", kLLTabBarItemAttributeSelectedImageName : @"account_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
   // [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor cyanColor]];
    [[UINavigationBar appearance]  setTranslucent:YES];
    [[UINavigationBar appearance]  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    self.window.rootViewController = tabBarController;
}

#pragma mark - LLTabBarDelegate

- (void)tabBarDidSelectedRiseButton {
    
    NSLog(@"tabBarDidSelectedRiseButton");
    /*
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    */
    
}





#pragma mark Private method

-(UIImage *)imageWithName:(NSString *)name isSelected:(BOOL)isSelected{
    if (!isSelected) {
        return [UIImage imageNamed:name];
    }else{
        return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}



@end
