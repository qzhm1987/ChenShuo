//
//  OrderModel.h
//  ChenShuo
//
//  Created by youdian on 2019/4/24.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject

@property (nonatomic,assign)NSInteger ID;
@property (nonatomic ,copy) NSString *image;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *price;
@property (nonatomic ,copy) NSString *addTime;
@property (nonatomic ,assign) NSInteger number;

@end

NS_ASSUME_NONNULL_END
