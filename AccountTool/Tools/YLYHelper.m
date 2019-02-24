//
//  YLYHelper.m
//  TestDemo
//
//  Created by yu on 31/08/2017.
//  Copyright © 2017 yu. All rights reserved.
//

#import "YLYHelper.h"
#import "YLYDefine.h"
#import <MBProgressHUD.h>
#import "CategoryConfig.h"

@interface YLYHelper ()

@property (nonatomic, readwrite, strong)MBProgressHUD *textHud;
@property (nonatomic, readwrite, strong)MBProgressHUD *processHud;

@property (nonatomic, readwrite, assign)BOOL textShowing;//文字正在显示
@property (nonatomic, readwrite, assign)BOOL processShowing;//菊花正在显示

@property (nonatomic, readwrite, assign)CGFloat rate;//宽度比例

@end

@implementation YLYHelper

static YLYHelper *helper = nil;

+ (instancetype)shareHelper {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[super allocWithZone:NULL] init];
        [helper initBaseConfig];
    });
    
    return helper;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shareHelper];
}

- (void)initBaseConfig {
    //获取宽度比例
    [self getRate];
}

- (void)getRate {
    //倍率 按照设计的6屏幕宽度为标准,高度有偏差
    double rate = 0.0f;
    
    //#define iPhone6P ((SCREEN_WIDTH == 414)?YES:NO)//414.000000, 736.000000
    //#define iPhone6 ((SCREEN_WIDTH == 375)?YES:NO)//375.000000, 667.000000
    //#define iPhone5 ((SCREEN_WIDTH == 320)?YES:NO)//320.000000, 568.000000
    //#define iPhoneX ((SCREEN_WIDTH == 375) && (SCREEN_HEIGHT == 812)?YES:NO)//375.000000, 812.000000
    if (iPhoneXMax) {
        rate = SCREEN_WIDTH/375.0f;
    } else if (iPhoneX) {
        rate = 1.0f;
    } else if (iPhone6P) {
        rate = 414.0f/375.0f;
    } else if (iPhone6) {
        rate = 1.0f;
    } else if (iPhone5){
        rate = 320.0f/375.0f;
    }
    
    self.rate = rate;
}

+ (void)registerNotificationName:(NSString *)notiName object:(id)object event:(notificationBlock)block {
    [[NSNotificationCenter defaultCenter] addObserverForName:notiName
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue] /*暂时放在主线程*/
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                           if (block != nil) {
                                                               block(note);
                                                           }
                                                       }
     ];
}

+ (void)removeNotificationName:(NSString *)notiName observer:(id)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:notiName
                                                  object:nil];
}

//自动适配Rect
+ (CGRect)autoAdjustRect:(CGRect)rect {
    CGRect retRect = CGRectMake(0, 0, 0, 0);
    CGFloat rate = [self shareHelper].rate;
    retRect = CGRectMake(rect.origin.x * rate, rect.origin.y * rate, rect.size.width * rate, rect.size.height * rate);
    return retRect;
}


//自动适配长度
+ (CGFloat)autoAdjustWidth:(CGFloat)width {
    CGFloat retFloat = 0.0f;
    retFloat = width * [self shareHelper].rate;
    return retFloat;
}

//自动适配Font
+ (UIFont *)autoAdjustFont:(CGFloat)fontFloat {
    UIFont *retFont = [UIFont systemFontOfSize:0];
    retFont = [UIFont systemFontOfSize:fontFloat * [self shareHelper].rate;
    return retFont;
}


//显示hub提示
- (void)showHudViewWithString:(NSString *)promptString {
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
- (void)openProcessHudViewText:(NSString *)showText {
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
    showText = [NSString checkNullString:showText];
    if (showText.length == 0) {
        _processHud.label.text = @"加载中...";
    } else {
        _processHud.label.text = showText;
    }
    
    [_processHud showAnimated:YES];
}
//关闭菊花
- (void)closeProcessHudView {
    [_processHud hideAnimated:YES];
    self.processShowing = NO;
}


@end
