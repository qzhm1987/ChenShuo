//
//  CollectionViewCell.h
//  ChenShuo
//
//  Created by youdian on 2019/4/23.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic)UIImageView *logoView;
@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic)UILabel *priceLabel;
@end

NS_ASSUME_NONNULL_END
