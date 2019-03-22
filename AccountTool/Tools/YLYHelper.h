//
//  YLYHelper.h
//  TestDemo
//
//  Created by yu on 31/08/2017.
//  Copyright © 2017 yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YLYHelper : NSObject

// 屏幕尺寸宽度比例
@property (nonatomic, readonly, assign)CGFloat rate;

+ (instancetype)shareHelper;

//适配
//基于6宽度适配rect
+ (CGRect)autoAdjustRect:(CGRect)rect;
//基于6屏幕适配长度
+ (CGFloat)autoAdjustWidth:(CGFloat)width;
//基于6屏幕适配字体
+ (UIFont *)autoAdjustFont:(CGFloat)fontFloat;


@end
