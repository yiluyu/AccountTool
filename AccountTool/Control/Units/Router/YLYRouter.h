//
//  YLYRouter.h
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YLYRootTabbarController;
@class YLYRootNavigationController;

NS_ASSUME_NONNULL_BEGIN

@interface YLYRouter : NSObject

+ (instancetype)shareInstance;

/** tabbar */
@property (nonatomic, readonly, strong)YLYRootTabbarController *tabbarController;

//navi
@property (nonatomic, readonly, strong)YLYRootNavigationController *mainNavi;//主流程navi
@property (nonatomic, readonly, strong)YLYRootNavigationController *loginNavi;//注册流程navi


/* 推出页面方法 */

#pragma mark - < 登录 >
/** 推出loginVC */
+ (void)pushLoginVC;
/** 收回loginVC */
+ (void)closeLoginVC;


@end

NS_ASSUME_NONNULL_END
