//
//  WFTableViewCell.m
//  MVC
//
//  Created by fly on 2017/5/11.
//  Copyright © 2017年 fly. All rights reserved.
//

#import "WFTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface WFTableViewCell ()
{
    UIImageView *_iconImage;
    UILabel     *_userName;
    UILabel     *_myTextLabel;
}
@end

@implementation WFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self wf_setUpViews];       /*添加基础组件*/
        [self wf_makeConstraints];  /*设置约束*/
    }
    return self;
}

- (void)wf_setUpViews {
    _iconImage = [[UIImageView alloc] init];
    _iconImage.layer.cornerRadius  = 30;
    _iconImage.layer.masksToBounds = YES;
    [self.contentView addSubview:_iconImage];
    
    _userName = [[UILabel alloc] init];
    _userName.font = [UIFont fontWithName:@"Courier-Oblique" size:18];
    [self.contentView addSubview:_userName];
    
    _myTextLabel = [[UILabel alloc] init];
    _myTextLabel.numberOfLines = 0;
    _myTextLabel.font = [UIFont fontWithName:@"Courier-Oblique" size:18];
    [self.contentView addSubview:_myTextLabel];
}

- (void)wf_makeConstraints {
    WS(ws);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView.mas_top).with.offset(20);
        make.left.equalTo(ws.contentView.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImage.mas_right).with.offset(20);
        make.right.equalTo(ws.contentView.mas_right).with.offset(-20);
        make.top.equalTo(_iconImage.mas_centerY);
    }];
    [_myTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImage.mas_bottom).with.offset(40);
        make.bottom.equalTo(ws.contentView.mas_bottom).with.offset(-20);
        make.left.equalTo(ws.contentView.mas_left).with.offset(20);
        make.right.equalTo(ws.contentView.mas_right).with.offset(-20);
    }];
}

#pragma mark - 重写属性的set方法，在调用时直接赋值给组件

- (void)setIconURL:(NSURL *)iconURL {
    _iconURL = iconURL;
    [_iconImage setImageWithURL:_iconURL];
}

- (void)setNameString:(NSString *)nameString {
    _nameString    = nameString;
    _userName.text = _nameString;
}

- (void)setTextString:(NSString *)textString {
    _textString       = textString;
    _myTextLabel.text = _textString;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
