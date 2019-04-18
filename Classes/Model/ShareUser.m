//
//  ShareUser.m
//  ChenShuo
//
//  Created by youdian on 2019/4/18.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "ShareUser.h"
static ShareUser *user = nil;
@implementation ShareUser
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        if (!user) {
            user = [super allocWithZone:zone];
        }
    });
    return user;
}

+(ShareUser *)shareUser{
    return [[self alloc]init];
}

#pragma mark - Key Value Coding

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"%@：获取键值出错，未定义的键：%@", NSStringFromClass([self class]), key);
    // subclass implementation should provide correct key value mappings for custom keys
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"未定义的键：%@",key);
    // subclass implementation should set the correct key value mappings for custom keys
}

@end
