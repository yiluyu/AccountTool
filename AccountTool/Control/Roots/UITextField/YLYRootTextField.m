//
//  YLYRootTextField.m
//  Eyuemeiche
//
//  Created by yu on 07/03/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import "YLYRootTextField.h"
#import "NSString+ExtendMethod.h"

@implementation YLYRootTextField


/* 快速创建 */
+ (YLYRootTextField *)createTextFieldPlaceHolder:(NSString *)placeHolder fontFloat:(CGFloat)fontFloat textColor:(UIColor *)textColor {
    YLYRootTextField *tempTextField = [[YLYRootTextField alloc] init];
    tempTextField.placeholder = [NSString safeString:placeHolder];
    tempTextField.font = [UIFont systemFontOfSize:(fontFloat > 0)? fontFloat : 8];
    tempTextField.textColor = textColor;
    
    return tempTextField;
}

@end
