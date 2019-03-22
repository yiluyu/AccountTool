//
//  YLYServiceManager.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYServiceManager.h"
#import "YLYDefine.h"
#import "YLYRootServer.h"

@interface YLYServiceManager ()

//! 服务列表
@property (nonatomic, readwrite, copy)NSArray *serviceList;

@end

@implementation YLYServiceManager

static YLYServiceManager *instance = nil;

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
    // 注意server的顺序，会有初始化时机差别
    self.serviceList = @[@"YLYLocalConfigServer", @"YLYNetServer", @"YLYRouterServer", @"YLYTrackerServer"];
}


#pragma mark - < interface method >

+ (void)runAllServices {
    [[self shareInstance] private_runAllServices];
}

- (void)private_runAllServices {
    NSArray *tempArr = self.serviceList;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        for (NSInteger i = 0; i < tempArr.count; i ++) {
            Class class = NSClassFromString([NSString safeString:self.serviceList[i]]);
        
            id server = [[class alloc] init];
            if (server == nil) {
                YLYLog(@"没有这个服务:%@", tempArr[i]);
                continue;
            }
            
            if (![server conformsToProtocol:@protocol(YLYServerProtocol)]) {
                YLYLog(@"服务没有遵守server协议:%@", tempArr[i]);
                continue;
            }
            
            [(YLYRootServer *)server start];
            YLYLog(@"启动 %@ 服务", tempArr[i]);
        }
    });
}

@end
