//
//  YLYPropertyManager.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYPropertyManager.h"
#import "YLYDefine.h"

@implementation YLYPropertyManager

+ (instancetype)shareInstance {
    static YLYPropertyManager *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[super allocWithZone:NULL] init];
    });
    
    return shareInstance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

@end
