//
//  UILabel+ExtendMethod.m
//  Eyuemeiche
//
//  Created by yu on 05/03/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import "UILabel+ExtendMethod.h"
#import "NSString+ExtendMethod.h"

@implementation UILabel (ExtendMethod)

+ (UILabel *)createNormalLabelText:(NSString *)text font:(CGFloat)fontFloat color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    UILabel *tempLabel = [[UILabel alloc] init];
    // 内容
    tempLabel.text = [NSString safeString:text];
    // 文字大小
    tempLabel.font = [UIFont systemFontOfSize:(fontFloat > 0?fontFloat:8)];
    // 文字颜色
    tempLabel.textColor = ([color isKindOfClass:[NSNull class]]?[UIColor blackColor]:color);
    // 文字对齐方式
    tempLabel.textAlignment = alignment;
    
    return tempLabel;
}

@end
