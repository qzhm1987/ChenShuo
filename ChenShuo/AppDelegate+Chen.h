//
//  AppDelegate+Chen.h
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Chen)<LLTabBarDelegate>

-(void)goMainWindowRootController;
-(void)commonTabBarRootController;
-(void)AddButtonTabBarRootController;
@end

NS_ASSUME_NONNULL_END
