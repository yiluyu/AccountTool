//
//  YLYRootLabel.h
//  Eyuemeiche
//
//  Created by yu on 27/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLYRootLabel;

@interface YLYRootLabel : UILabel

/**
 * @brief 创建label
 * @discussion 创建一个label, frame需要额外设置
 * @param text 显示的文字
 * @param fontFloat 文字大小
 * @param color 文字颜色
 * @param alignment 文案对齐方式
 */
+ (UILabel *)createNormalLabelText:(NSString *)text
                              font:(CGFloat)fontFloat
                             color:(UIColor *)color
                         alignment:(NSTextAlignment)alignment;

@end
