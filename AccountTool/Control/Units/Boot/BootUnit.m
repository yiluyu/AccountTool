//
//  BootUnit.m
//  Eyuemeiche
//
//  Created by yu on 12/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import "BootUnit.h"

#import "YLYPropertyManager.h"

#import "YLYDefine.h"

@interface BootUnit ()



@end

@implementation BootUnit

+ (instancetype)shareUnit {
    static BootUnit *unit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unit = [[super allocWithZone:NULL] init];
        
        [unit systemInit];
    });
    
    return unit;
}
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareUnit];
}





#pragma -mark 事件处理




#pragma -mark 获取系统一些属性
//一次性获取属性, 其他判断直接取值
- (void)systemInit {
    //验证是否第一次启动
    [self getFirstStatus];
    //获取提供第三方服务器的id
    [self getIDForVendor];
    //适配iOS 11
    [self adaptSystem];
}



#pragma -mark 功能方法
- (void)getFirstStatus {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:CONSTANT_USERDEFAULTS_APPFIRSTLAUNCH] == NO) {
        YLYLog(@"第一次启动app");
        //默认空token
        USERDEFAULTS_SET(@"", CONSTANT_USERDEFAULTS_ACCESSTOKEN);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:CONSTANT_USERDEFAULTS_APPFIRSTLAUNCH];
        USERDEFAULTS_SYNC();
        
        [YLYPropertyManager shareInstance].isFirstLaunch = YES;
    } else {
        YLYLog(@"非第一次启动app");
        [YLYPropertyManager shareInstance].isFirstLaunch = NO;
    }
}

- (void)getIDForVendor {
    NSString *UUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
    YLYLog(@"UUID = %@", UUID);
    USERDEFAULTS_SET([NSString safeString:UUID], CONSTANT_USERDEFAULTS_LOCALUUID);
    USERDEFAULTS_SYNC();
    
    [YLYPropertyManager shareInstance].UUIDString = UUID;
}

- (void)adaptSystem {
    //tableView自动估算行高问题
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    if (@available (iOS 11, *)) {
        //tableView安全区适配问题
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //webView下移
        [UIWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}




@end
