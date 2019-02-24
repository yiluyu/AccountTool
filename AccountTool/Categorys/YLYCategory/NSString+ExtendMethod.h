//
//  NSString+ExtendMethod.h
//  Eyuemeiche
//
//  Created by yu on 07/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ExtendMethod)

/// 获取安全字符串
+ (NSString *)safeString:(NSString *)inputString;

/// string转化货币格式
+ (NSString *)stringToMoney:(NSString *)inputString;

/// 金钱格式转float
+ (NSString *)moneyToString:(NSString *)inputString;

/// 字符串去空格
+ (NSString *)clearSpace:(NSString *)inputString;

@end
