//
//  YLYRouter.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYRouter.h"
#import "BootUnit.h"
#import "YLYDefine.h"
#import "YLYPropertyManager.h"

#import "YLYRootTabbarController.h"
#import "YLYRootNavigationController.h"

// 登录
#import "LoginViewController.h"

// tab 模块
#import "MainListViewController.h"
#import "SettingViewController.h"
#import "SearchingViewController.h"

@interface YLYRouter ()

//! 是否正在展示登录页面
@property (nonatomic, readwrite, assign)BOOL loginVCShowing;

@property (nonatomic, readwrite, strong)YLYRootTabbarController *tabbarController;
@property (nonatomic, readwrite, strong)YLYRootNavigationController *mainNavi;//主流程navi
@property (nonatomic, readwrite, strong)YLYRootNavigationController *loginNavi;//注册流程navi

@end

@implementation YLYRouter

+ (instancetype)shareInstance {
    static YLYRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[super allocWithZone:NULL] init];
        [router initBaseConfig];
        [router createTabbar];
    });
    
    return router;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareInstance];
}

- (void)initBaseConfig {
    
}


//创建tabbar
- (void)createTabbar {
    self.tabbarController = [[YLYRootTabbarController alloc] init];
    _tabbarController.selectedIndex = 0;
    _tabbarController.tabBar.hidden = YES;
    
    // 列表
    MainListViewController *listVC = [[MainListViewController alloc] init];
    // 搜索
    SearchingViewController *searchVC = [[SearchingViewController alloc] init];
    // 设置
    SettingViewController *setVC = [[SettingViewController alloc] init];
    
    _tabbarController.viewControllers = @[listVC, searchVC, setVC];
    
    //Navi
    self.mainNavi = [[YLYRootNavigationController alloc] initWithRootViewController:_tabbarController];
    _mainNavi.navigationBar.translucent = NO;
    _mainNavi.navigationBar.hidden = YES;
    
}

#pragma mark - < 设置属性 >

- (void)setLoginVCShowing:(BOOL)loginVCShowing {
    _loginVCShowing = loginVCShowing;
    [YLYPropertyManager shareInstance].loginVCShowing = loginVCShowing;
}



#pragma mark - < interface method >

+ (void)pushLoginVC {
    [[self shareInstance] private_pushLoginVC];
}

+ (void)closeLoginVC {
    [[self shareInstance] private_closeLoginVC];
}



#pragma mark - < 页面跳转 >

// 登录页
// 推出loginVC
- (void)private_pushLoginVC {
    if (self.loginVCShowing == YES) {
        return;
    }
    
    if (_loginNavi == nil) {
        // 登录页
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        self.loginNavi = [[YLYRootNavigationController alloc] initWithRootViewController:loginVC];
        _loginNavi.navigationBar.translucent = NO;
        _loginNavi.navigationBar.hidden = YES;
    }
    
    __weak typeof (YLYRootTabbarController *)weakTabbar = _tabbarController;
    __weak typeof (YLYRootNavigationController *)weakMainNavi = _mainNavi;
    [_mainNavi presentViewController:_loginNavi animated:YES completion:^{
        weakTabbar.selectedIndex = 0;
        [weakMainNavi popToRootViewControllerAnimated:NO];
    }];
}

// 收回
- (void)private_closeLoginVC {
    SELF_WEAK();
    __weak typeof (YLYRootTabbarController *)weakTabbar = _tabbarController;
    __weak typeof (YLYRootNavigationController *)weakMainNavi = _mainNavi;
    [_loginNavi dismissViewControllerAnimated:YES completion:^{
        SELF_STRONG();
        strongSelf.loginVCShowing = NO;
        weakTabbar.selectedIndex = 0;
        [weakMainNavi popToRootViewControllerAnimated:NO];
    }];
    
    self.loginNavi = nil;
}

@end
