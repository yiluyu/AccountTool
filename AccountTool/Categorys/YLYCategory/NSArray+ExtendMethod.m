//
//  NSArray+ExtendMethod.m
//  AccountTool
//
//  Created by yu on 2019/1/31.
//  Copyright © 2019 yu. All rights reserved.
//

#import "NSArray+ExtendMethod.h"

@implementation NSArray (ExtendMethod)

+ (BOOL)checkSafeArray:(id)list itemClass:(Class)itemClass {
    if (list != nil
        && [list isKindOfClass:[NSArray class]]) {
        if (itemClass == nil) {
            // 未指定 itemClass 类型
            return YES;
        } else {
            for (id item in list) {
                if (item == nil
                    || ![item isKindOfClass:itemClass]) {
                    return NO;
                }
            }
            
            // 循环完成
            return YES;
        }
    } else {
        return NO;
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index < 0) {
        return nil;
    }
    
    if (index > self.count-1) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

@end
