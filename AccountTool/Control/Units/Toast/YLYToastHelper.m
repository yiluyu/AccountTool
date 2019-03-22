//
//  YLYToastHelper.m
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import "YLYToastHelper.h"
#import <MBProgressHUD.h>
#import "YLYDefine.h"

@interface YLYToastHelper ()

@property (nonatomic, readwrite, strong)MBProgressHUD *textHud;
@property (nonatomic, readwrite, strong)MBProgressHUD *processHud;

@property (nonatomic, readwrite, assign)BOOL textShowing;//文字正在显示
@property (nonatomic, readwrite, assign)BOOL processShowing;//菊花正在显示

@end

@implementation YLYToastHelper

#pragma mark - < init >

static YLYToastHelper *instance = nil;

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
    self.textShowing = NO;
    self.processShowing = NO;
    self.textHud = nil;
    self.processHud = nil;
}

#pragma mark - < interface method >

+ (void)showHudViewWithString:(NSString *)promptString {
    [[self shareInstance] private_showHudViewWithString:promptString];
}

+ (void)openProcessHudViewText:(NSString *)showText {
    [[self shareInstance] private_openProcessHudViewText:showText];
}

+ (void)closeProcessHudView {
    [[self shareInstance] private_closeProcessHudView];
}


#pragma mark - < private method >

//显示hub提示
- (void)private_showHudViewWithString:(NSString *)promptString {
    if (self.textShowing == YES || self.processShowing == YES) {
        return;
    }
    self.textShowing = YES;
    
    if (self.textHud == nil) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.textHud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        [keyWindow addSubview:_textHud];
        _textHud.mode = MBProgressHUDModeText;
        _textHud.label.text = promptString;
        _textHud.margin = 10.f;
        _textHud.removeFromSuperViewOnHide = YES;
        [_textHud showAnimated:YES];
        [_textHud hideAnimated:YES afterDelay:1.0f];
    } else {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:_textHud];
        _textHud.label.text = promptString;
        [_textHud showAnimated:YES];
        [_textHud hideAnimated:YES afterDelay:1.0f];
    }
    
    SELF_WEAK();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.textShowing = NO;
    });
}


//打开菊花
- (void)private_openProcessHudViewText:(NSString *)showText {
    if (self.processShowing == YES || self.textShowing == YES) {
        return;
    }
    self.processShowing = YES;
    
    if (self.processHud == nil) {
        self.processHud = [[MBProgressHUD alloc] init];
        _processHud.mode = MBProgressHUDModeAnnularDeterminate;
        _processHud.label.text = showText;
        _processHud.label.font = CONSTANT_FONT_SMALL;
        _processHud.animationType = MBProgressHUDAnimationZoomOut;
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:_processHud];
    }
    showText = [NSString safeString:showText];
    if (showText.length == 0) {
        _processHud.label.text = @"加载中...";
    } else {
        _processHud.label.text = showText;
    }
    
    [_processHud showAnimated:YES];
}
//关闭菊花
- (void)private_closeProcessHudView {
    [_processHud hideAnimated:YES];
    self.processShowing = NO;
}

@end
