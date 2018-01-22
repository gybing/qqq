//
//  FlLocalStoreManager.h
//  QT
//
//  Created by DavidYang on 16/4/25.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HJGLoginBaseModel;

/**
 *  本地存储
 */
@interface FlLocalStoreManager : NSObject


#pragma mark -- user data

+ (NSArray*)getUserInfo;
+ (void)saveUserInfo:(NSArray*)userInfo;
+ (void)removeUserInfo;


#pragma mark -- default key value store

/**
 *  实体类归档
 *
 *  @param value 实体类
 *  @param key   key
 */
+ (void)setValueInDefault:(id)value withKey:(NSString *)key;
+ (id)getValueFromDefaultWithKey:(NSString *)key;

@end
