//
//  AppDelegate+Chen.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "AppDelegate+Chen.h"

#define Theme_Color [UIColor colorWithRed:0.0f/255.0 green:164.0f/255.0 blue:228.0f/255.0 alpha:1.0f]

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
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:second];
    
    UIViewController *third =[NSClassFromString(@"UIViewController") new];
    third.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:third];
    
    
    UIViewController  *mine = [NSClassFromString(@"MineViewController") new];
    UINavigationController *mineNav  = [[UINavigationController alloc]initWithRootViewController:mine];
    mainNav.tabBarItem.title = @"首页";
    secondNav.title = @"推荐";
    thirdNav.tabBarItem.title = @"发现";
    mineNav.tabBarItem.title = @"我的";
    
    mainNav.tabBarItem.image = [UIImage imageNamed:@""];
    mainNav.tabBarItem.selectedImage =[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    secondNav.tabBarItem.image = [UIImage imageNamed:@""];
    secondNav.tabBarItem.selectedImage = [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdNav.tabBarItem.image = [UIImage imageNamed:@""];
    thirdNav.tabBarItem.selectedImage = [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNav.tabBarItem.image = [UIImage imageNamed:@""];
    mineNav.tabBarItem.selectedImage =[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabBar.viewControllers = @[mainNav,secondNav,thirdNav,mineNav];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:Theme_Color];
    [[UINavigationBar appearance]  setTranslucent:NO];
    [[UINavigationBar appearance]  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
   self.window.rootViewController = tabBar;
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
