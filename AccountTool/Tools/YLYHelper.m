//
//  YLYHelper.m
//  TestDemo
//
//  Created by yu on 31/08/2017.
//  Copyright © 2017 yu. All rights reserved.
//

#import "YLYHelper.h"
#import "YLYDefine.h"

@interface YLYHelper ()

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


//自动适配Rect
+ (CGRect)autoAdjustRect:(CGRect)rect {
    CGRect retRect = CGRectMake(0, 0, 0, 0);
    CGFloat rate = [[self shareHelper] rate];
    retRect = CGRectMake(rect.origin.x * rate, rect.origin.y * rate, rect.size.width * rate, rect.size.height * rate);
    return retRect;
}


//自动适配长度
+ (CGFloat)autoAdjustWidth:(CGFloat)width {
    CGFloat retFloat = 0.0f;
    retFloat = width * [[self shareHelper] rate];
    return retFloat;
}

//自动适配Font
+ (UIFont *)autoAdjustFont:(CGFloat)fontFloat {
    UIFont *retFont = [UIFont systemFontOfSize:0];
    retFont = [UIFont systemFontOfSize:fontFloat * [[self shareHelper] rate]];
    return retFont;
}

// 是否是iPhoneX系列
+ (BOOL)isIphoneXSeries {
    UIEdgeInsets safeArea = UIEdgeInsetsMake(20, 0, 0, 0);
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
        safeArea = mainWindow.safeAreaInsets;
    }
    
    // {44, 0, 34, 0}
    if (safeArea.bottom > 0) {
        return YES;
    } else {
        return NO;
    }
}



@end
