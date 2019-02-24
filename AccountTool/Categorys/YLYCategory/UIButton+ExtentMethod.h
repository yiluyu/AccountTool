//
//  UIButton+ExtentMethod.h
//  Eyuemeiche
//
//  Created by yu on 16/04/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ExtentMethod)

///按钮响应时间间隔, 默认 0.5f
@property (nonatomic, readwrite, assign)NSTimeInterval actionIntervalTime;

///四周扩大响应区域
- (void)setEnlargeEdge:(CGFloat)size;
///指定方向扩大相应区域
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

/**
 * @brief 创建button
 * @discussion 创建一个button, frame需要额外设置
 * @param text 显示的文字
 * @param fontFloat 文字大小 不小于8
 * @param color 文字颜色
 */
+ (UIButton *)createNormalButtonText:(NSString *)text
                                font:(CGFloat)fontFloat
                               color:(UIColor *)color;

@end
