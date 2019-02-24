//
//  UITextField+ExtentMethod.h
//  Eyuemeiche
//
//  Created by yu on 24/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ExtentMethod)

/**
 * @brief 快速创建 textField
 */
+ (UITextField *)createTextFieldPlaceHolder:(NSString *)placeHolder
                                  fontFloat:(CGFloat)fontFloat
                                  textColor:(UIColor *)textColor;

@end
