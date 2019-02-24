//
//  NSDictionary+ExtendMethod.h
//  Eyuemeiche
//
//  Created by yiluyu on 2018/10/16.
//  Copyright © 2018年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ExtendMethod)

- (id)safeObjectForKey:(id)aKey;
- (id)safeValueForKey:(NSString *)aKey;
- (id)safeValueForKeyPath:(NSString *)keyPath;

@end
