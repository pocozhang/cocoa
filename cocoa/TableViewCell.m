//
//  TableViewCell.m
//  cocoa
//
//  Created by admin on 17/4/11.
//  Copyright © 2017年 yueyue. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#define SCREENWITDH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface TableViewCell ()

@property (nonatomic, retain) UIImageView *image;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIButton *button;

@end

@implementation TableViewCell

- (float)getAutoCellHeight {

    [self layoutSubviews];

    return  self.button.frame.origin.y + self.button.frame.size.height + 15;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.title.length) {
        self.label.text = self.title;
    }
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@15);
//        make.size.width.equalTo(@(SCREENWITDH-30));
//        make.size.height.equalTo(@(0.5*(SCREENWITDH-30)));
        make.size.mas_equalTo(CGSizeMake(SCREENWITDH-30, 0.5*(SCREENWITDH-30)));
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(self.image.mas_bottom).offset(20);
        make.width.lessThanOrEqualTo(@(SCREENWITDH-30));
        [self.label sizeToFit];
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.size.width.lessThanOrEqualTo(@200);
        make.left.equalTo(@100);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
    }];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
        self.clipsToBounds = false;
    }
    return self;
}

- (void)initContentView
{
    [self addSubview:self.image];
    [self addSubview:self.label];
    [self addSubview:self.button];
    [self layoutSubviews];
}

- (UIImageView *)image
{
    if (!_image) {
        _image = [[UIImageView alloc] init];
        _image.image = [UIImage imageNamed:@"11111.jpg"];
    }
    return _image;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"这是第%ld行打算打算打打打打打多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多大石是所所所所所所绿扩连开发机奥所所所所所所所所所所所所所所所所所付军扩绿";
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setBackgroundColor:[UIColor blueColor]];
        [_button setTitle:@"这是一个按钮" forState: UIControlStateNormal];
        [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _button;
}

@end
