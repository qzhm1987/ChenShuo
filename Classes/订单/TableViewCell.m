//
//  TableViewCell.m
//  ChenShuo
//
//  Created by youdian on 2019/4/23.
//  Copyright © 2019 ChenShuo. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imgView = [UIImageView new];
        [self addSubview:_imgView];
        _nameLabel = [UILabel new];
        [self addSubview:_nameLabel];
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:13.0f];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor redColor];
        [self addSubview:_priceLabel];
        _timeLabel = [UILabel new];
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:_timeLabel];
        
        
       _addressImgView = [UIImageView new];
        _addressImgView.image = [UIImage imageNamed:@"location"];
        [self addSubview:  _addressImgView];
        _addressLabel = [UILabel new];
        [self addSubview:_addressLabel];
       _numberLabel= [UILabel new];
        [self addSubview:_numberLabel];
        
        UILabel *addressLabel = [UILabel new];
        addressLabel.font = [UIFont systemFontOfSize:13.0f];
        addressLabel.text = @"石家庄中兴路东路南花间坊";
        addressLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:addressLabel];
        [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressImgView.mas_right).offset(5);
            make.centerY.equalTo(self.addressImgView);
            make.size.mas_equalTo(CGSizeMake(180, 25));
        }];
        
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.layer.cornerRadius = 15.0f;
        _button.backgroundColor = [UIColor colorWithRed:255.0f/255.0 green:67.0f/255.0 blue:108.0f/255.0 alpha:1.0f];
        [_button setTitle:@"提取" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-20);
            make.right.equalTo(self).offset(0);
            make.size.mas_equalTo(CGSizeMake(65, 30));
        }];
        
        UIImageView *line = [UIImageView new];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
        }];
        
        
        
    }
    
    
    

    return self;
}


-(void)layoutSubviews {
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView).offset(10);
        make.left.equalTo(self.imgView.mas_right).offset(5);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(0);
        make.centerY.equalTo(self.nameLabel);
        make.size.mas_equalTo(CGSizeMake(80, 25));
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(200, 25));
    }];
    [_addressImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel);
        make.bottom.equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.priceLabel.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(35, 30));
    }];
    
    
    
    
}

@end
