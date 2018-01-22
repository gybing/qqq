//
//  HJGBottomTableViewCell.m
//  qqq
//
//  Created by Developer on 2018/1/22.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGBottomTableViewCell.h"

@implementation HJGBottomTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI{
 
    [self bottomView];
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        UIView * theView = [[UIView alloc] init];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.right.equalTo(self.contentView);
        }];
        _bottomView = theView;
    }
    return _bottomView;
}
@end
