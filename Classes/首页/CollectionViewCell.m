//
//  CollectionViewCell.m
//  ChenShuo
//
//  Created by youdian on 2019/4/23.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(id)initWithFrame:(CGRect)frame{
     CGFloat itemWidth = (SCREEN_WIDTH-30)/2;
    self = [super initWithFrame:frame];
    if (self) {
        _logoView = [[UIImageView alloc]init];
        _logoView.layer.cornerRadius = 12.0f;
        [self addSubview:_logoView];
        [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(itemWidth, itemWidth));
        }];
        _titleLabel = [UILabel new];
        [_titleLabel sizeToFit];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.logoView);
            make.top.equalTo(self.logoView.mas_bottom).offset(0);
            make.size.mas_equalTo(CGSizeMake(150, 30));
        }];
        _priceLabel = [UILabel new];
        _priceLabel.textColor = [UIColor redColor];
        [_priceLabel sizeToFit];
        [self addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.logoView);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.size.mas_equalTo(CGSizeMake(120, 25));
        }];
        
        
        
        
        
       
    self.clipsToBounds = YES;
    }
    
      return self;

}


@end
