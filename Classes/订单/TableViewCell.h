//
//  TableViewCell.h
//  ChenShuo
//
//  Created by youdian on 2019/4/23.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic)UIImageView *imgView;
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UILabel *priceLabel;
@property (strong, nonatomic)UILabel *timeLabel;
@property (strong, nonatomic)UIImageView *addressImgView;
@property (strong, nonatomic)UILabel *addressLabel;
@property (strong, nonatomic)UILabel *numberLabel;
@property (strong, nonatomic)UIButton *button;

@end

NS_ASSUME_NONNULL_END
