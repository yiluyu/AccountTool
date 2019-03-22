//
//  YLYToastHelper.h
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLYToastHelper : NSObject

//提示
/** 显示hud提示 */
+ (void)showHudViewWithString:(NSString *)promptString;

/*
 showText: 当传nil、@""等空字符时，自动填充为 @"加载中..."
 */
/** 打开菊花view */
+ (void)openProcessHudViewText:(NSString *)showText;

/** 手动关闭等待view */
+ (void)closeProcessHudView;

@end

NS_ASSUME_NONNULL_END
