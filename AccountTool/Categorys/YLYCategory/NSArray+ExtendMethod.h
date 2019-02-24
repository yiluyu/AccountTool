//
//  NSArray+ExtendMethod.h
//  AccountTool
//
//  Created by yu on 2019/1/31.
//  Copyright © 2019 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ExtendMethod)

/**
 * @brief 是否符合数组规则
 * @discussion 检查传入数组是否合法, 当不传入 itemClass 时只检测 list 类型, 当传入 itemClass 时检测子元素类型
 * @param list 检测数组
 * @param itemClass 子元素类型
 */
+ (BOOL)checkSafeArray:(id)list itemClass:(Class)itemClass;

/**
 * @brief 获取元素
 */
- (id)safeObjectAtIndex:(NSUInteger)index;


@end
