//
//  HJGTableViewCell.m
//  qqq
//
//  Created by Developer on 2018/1/21.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGTableViewCell.h"

#define wi   WIDTH/7.5
#define hi   40

@implementation HJGTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (UILabel *)preLab
{
    if (!_preLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:11];
        theView.textColor = [UIColor grayColor];
        theView.text = @"第1局";
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(3);
            make.size.equalTo(CGSizeMake(45, 30));
        }];
        _preLab = theView;
    }
    return _preLab;
}

#pragma mark - setupUI
- (void)setupUI{
 
    [self firstBut];
    [self secondBut];
    [self thirdBut];
    [self forthBut];
    
    [self fifthBut];
    
//    [self sixBut];
    
    [self zhuangBut];
    
    [self line_1];
    [self line_2];
    [self line_3];
    [self line_4];
    [self line_5];
}



- (UIView *)lineView
{
    if (!_lineView) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.equalTo(1);
        }];
        _lineView = theView;
    }
    return _lineView;
}

- (void)setModel:(HJGModel *)model{
    
    _model = model;
    
    [self.firstBut setTitle:[self sub_str:model.Number_1] forState:UIControlStateNormal];
    [self.secondBut setTitle:[self sub_str:model.Number_2] forState:UIControlStateNormal];
    [self.thirdBut setTitle:[self sub_str:model.Number_3] forState:UIControlStateNormal];
    [self.forthBut setTitle:[self sub_str:model.Number_4] forState:UIControlStateNormal];
    [self.fifthBut setTitle:[self sub_str:model.Number_5] forState:UIControlStateNormal];
//    [self.sixBut setTitle:model.Number_6 forState:UIControlStateNormal];
    [self.zhuangBut setTitle:[self sub_str:model.Number_zhuang] forState:UIControlStateNormal];
    
    if ([model.change intValue] ==1) {
        self.lineView.alpha = 1.f;
    }else{
        self.lineView.alpha = 0.f;
    }
    
    [self compareBut:self.firstBut xianText:model.Number_1 zhuangText:model.Number_zhuang];
    [self compareBut:self.secondBut xianText:model.Number_2 zhuangText:model.Number_zhuang];
    [self compareBut:self.thirdBut xianText:model.Number_3 zhuangText:model.Number_zhuang];
    [self compareBut:self.forthBut xianText:model.Number_4 zhuangText:model.Number_zhuang];
    [self compareBut:self.fifthBut xianText:model.Number_5 zhuangText:model.Number_zhuang];
//    [self compareBut:self.zhuangBut xianText:model.Number_zhuang zhuangText:model.Number_zhuang];
    
}


- (void)compareBut:(UIButton *)but xianText:(NSString *)xianText zhuangText:(NSString *)zhuangText
{
    
    if ([xianText containsString:@"----------------"]&&[zhuangText containsString:@"----------------"]) {
        NSString *xian = [self sub_str2:xianText];
        NSString *zhuang = [self sub_str2:zhuangText];
        if ([xian intValue] > [zhuang intValue]) {
            but.layer.borderColor = [UIColor redColor].CGColor;
        }else{
            but.layer.borderColor = RGB(198, 198, 198).CGColor;
        }
    }else{
        but.layer.borderColor = RGB(198, 198, 198).CGColor;
    }
    
}

- (NSString *)sub_str2:(NSString *)str{
    
    NSArray *arr = [str componentsSeparatedByString:@"----------------"];
    
    NSLog(@"---------------------%@",arr);
    return [arr objectAtIndex:1];
}

- (NSString *)sub_str:(NSString *)str{
    
    NSArray *arr = [str componentsSeparatedByString:@"----------------"];
    
    NSLog(@"---------------------%@",arr);
    return [arr objectAtIndex:0];
}


- (UIButton *)firstBut
{
    if (!_firstBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.layer.borderWidth = 2;
        theView.titleLabel.numberOfLines = 0;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.tag = 1;
//        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.preLab.right).offset(0);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _firstBut = theView;
    }
    return _firstBut;
}


- (UIButton *)secondBut
{
    if (!_secondBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.layer.borderWidth = 2;
        theView.titleLabel.numberOfLines = 0;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.tag = 2;
        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.firstBut.right).offset(3);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _secondBut = theView;
    }
    return _secondBut;
}


- (UIButton *)thirdBut
{
    if (!_thirdBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.layer.borderWidth = 2;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.tag = 3;
        theView.titleLabel.numberOfLines = 0;
        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.secondBut.right).offset(3);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _thirdBut = theView;
    }
    return _thirdBut;
}


- (UIButton *)forthBut
{
    if (!_forthBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.layer.borderWidth = 2;
        theView.tag = 4;
        theView.titleLabel.numberOfLines = 0;
        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.thirdBut.right).offset(3);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _forthBut = theView;
    }
    return _forthBut;
}

- (UIButton *)fifthBut
{
    if (!_fifthBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.layer.borderWidth = 2;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.tag = 5;
        theView.titleLabel.numberOfLines = 0;
        theView.layer.borderColor = RGB(198, 198, 198).CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.forthBut.right).offset(3);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _fifthBut = theView;
    }
    return _fifthBut;
}


//- (UIButton *)sixBut
//{
//    if (!_sixBut) {
//        UIButton * theView = [[UIButton alloc] init];
//        theView.layer.cornerRadius = 4;
//        theView.clipsToBounds = YES;
//        theView.layer.borderWidth = 2;
//        theView.titleLabel.font = [UIFont systemFontOfSize:11];
//        theView.tag = 6;
//        theView.titleLabel.numberOfLines = 0;
//        theView.layer.borderColor = [UIColor redColor].CGColor;
//        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.contentView addSubview:theView];
//        [theView makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView);
//            make.left.equalTo(self.fifthBut.right).offset(3);
//            make.size.equalTo(CGSizeMake( wi, 50));
//        }];
//        _sixBut = theView;
//    }
//    return _sixBut;
//}

- (UIButton *)zhuangBut
{
    if (!_zhuangBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = 4;
        theView.clipsToBounds = YES;
        theView.layer.borderWidth = 2;
        theView.titleLabel.font = [UIFont systemFontOfSize:11];
        theView.tag = 7;
        theView.titleLabel.numberOfLines = 0;
        theView.layer.borderColor = [UIColor greenColor].CGColor;
        [theView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.rowView.right).offset(2);
            make.size.equalTo(CGSizeMake(wi, hi));
        }];
        _zhuangBut = theView;
    }
    return _zhuangBut;
}

- (UIView *)rowView
{
    if (!_rowView) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.width.equalTo(2);
            make.left.equalTo(self.fifthBut.right).offset(2);
        }];
        _rowView = theView;
    }
    return _rowView;
}


- (UIView *)line_1
{
    if (!_line_1) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(46);
            make.width.equalTo(1);
            make.top.bottom.equalTo(self.contentView);
        }];
        _line_1 = theView;
    }
    return _line_1;
}


- (UIView *)line_2
{
    if (!_line_2) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstBut.right).offset(1);
            make.width.equalTo(1);
            make.top.bottom.equalTo(self.contentView);
        }];
        _line_2 = theView;
    }
    return _line_2;
}

- (UIView *)line_3
{
    if (!_line_3) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondBut.right).offset(1);
            make.width.equalTo(1);
            make.top.bottom.equalTo(self.contentView);
        }];
        _line_3 = theView;
    }
    return _line_3;
}

- (UIView *)line_4
{
    if (!_line_4) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.thirdBut.right).offset(1);
            make.width.equalTo(1);
            make.top.bottom.equalTo(self.contentView);
        }];
        _line_4 = theView;
    }
    return _line_4;
}


- (UIView *)line_5
{
    if (!_line_5) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = RGB(198, 198, 198);
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.forthBut.right).offset(1);
            make.width.equalTo(1);
            make.top.bottom.equalTo(self.contentView);
        }];
        _line_5 = theView;
    }
    return _line_5;
}
@end

