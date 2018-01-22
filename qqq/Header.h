//
//  Header.h
//  qqq
//
//  Created by Developer on 2018/1/21.
//  Copyright © 2018年 Developer. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <IQKeyboardManager.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import "UIImageView+WebCache.h"
#import "UIViewAdditions.h"

//这个宏加上后，可以去掉'mas_'这个前缀了
#define MAS_SHORTHAND
//这个宏加上后，可以去掉自动包装方法的'mas_'前缀
#define MAS_SHORTHAND_GLOBALS
//注意，这两个宏必须定义在这个头文件的上面，因为"Masonry.h"中要用到上面2个宏，如果已经定义过了的话
#import <Masonry.h>

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)

#endif /* Header_h */


/**
 *  强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 *  调用方式: `@weakify_self`实现弱引用转换，`@strongify_self`实现强引用转换
 *
 *  示例：
 *  @weakify_self
 *  [obj block:^{
 *  @strongify_self
 *      self.property = something;
 *  }];
 */
#ifndef    weakify_self
#if __has_feature(objc_arc)
#define weakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define weakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif
#ifndef    strongify_self
#if __has_feature(objc_arc)
#define strongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define strongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif

