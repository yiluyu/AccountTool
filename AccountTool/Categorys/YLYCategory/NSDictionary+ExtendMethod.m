//
//  NSDictionary+ExtendMethod.m
//  Eyuemeiche
//
//  Created by yiluyu on 2018/10/16.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "NSDictionary+ExtendMethod.h"

@implementation NSDictionary (ExtendMethod)

- (id)safeObjectForKey:(id)aKey {
    if (aKey == nil
        || [aKey isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return [self objectForKey:aKey];
}

- (id)safeValueForKey:(NSString *)aKey {
    if (aKey == nil
        || [aKey isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return [self valueForKey:aKey];
}

- (id)safeValueForKeyPath:(NSString *)keyPath {
    if (keyPath == nil
        || [keyPath isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return [self valueForKeyPath:keyPath];
}

@end
