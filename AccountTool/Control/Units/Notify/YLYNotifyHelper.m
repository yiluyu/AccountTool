//
//  YLYNotifyHelper.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYNotifyHelper.h"

@implementation YLYNotifyHelper

#pragma mark - < init >

static YLYNotifyHelper *instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
        [instance initBaseConfig];
    });
    
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

- (void)initBaseConfig {
    
}

@end
