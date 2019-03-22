//
//  YLYRootLabel.m
//  Eyuemeiche
//
//  Created by yu on 27/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import "YLYRootLabel.h"
#import "NSString+ExtendMethod.h"
#import "YLYDefine.h"

@implementation YLYRootLabel

+ (YLYRootLabel *)createNormalLabelText:(NSString *)text font:(CGFloat)fontFloat color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    YLYRootLabel *tempLabel = [[YLYRootLabel alloc] init];
    // 内容
    tempLabel.text = [NSString safeString:text];
    // 文字大小
    tempLabel.font = [UIFont systemFontOfSize:(fontFloat > 0?fontFloat:8)];
    // 文字颜色
    tempLabel.textColor = ([color isKindOfClass:[NSNull class]]?[UIColor blackColor]:color);
    // 文字对齐方式
    tempLabel.textAlignment = alignment;
    // 背景色默认透明
    tempLabel.backgroundColor = COLOR_CLEAR;
    
    return tempLabel;
}



@end
