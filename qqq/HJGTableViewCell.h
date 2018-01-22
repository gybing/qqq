//
//  HJGTableViewCell.h
//  qqq
//
//  Created by Developer on 2018/1/21.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJGModel.h"

@interface HJGTableViewCell : UITableViewCell

@property (nonatomic, weak) UILabel *preLab;

@property (nonatomic, weak) UIView *line_1;

@property (nonatomic, weak) UIView *line_2;

@property (nonatomic, weak) UIView *line_3;

@property (nonatomic, weak) UIView *line_4;

@property (nonatomic, weak) UIView *line_5;

@property (nonatomic, weak) UIButton *firstBut;

@property (nonatomic, weak) UIButton *secondBut;

@property (nonatomic, weak) UIButton *thirdBut;

@property (nonatomic, weak) UIButton *forthBut;

@property (nonatomic, weak) UIButton *fifthBut;

@property (nonatomic, weak) UIButton *sixBut;

@property (nonatomic, weak) UIButton *zhuangBut;

@property (nonatomic, strong) HJGModel *model;

@property (nonatomic, weak) UIView *lineView;

@property (nonatomic, weak) UIView *rowView;

@end
