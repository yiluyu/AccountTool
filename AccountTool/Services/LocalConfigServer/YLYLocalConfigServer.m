//
//  YLYUserInfoServer.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYLocalConfigServer.h"
#import "BootUnit.h"
#import "YLYPropertyManager.h"

@implementation YLYLocalConfigServer

- (void)start {
    // 配置本地app设置
    [self loadLocalConfig];
    
    // 系统本地信息初始化
    [self loadSystemConfig];
    
    // 用户信息初始化
    [self loadUserConfig];
}


- (void)loadLocalConfig {
    
}

- (void)loadSystemConfig {
    [BootUnit shareUnit];
}

- (void)loadUserConfig {
    
}

@end
