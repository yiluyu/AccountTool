//
//  YLYRootTextField.h
//  Eyuemeiche
//
//  Created by yu on 07/03/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YLYRootTextField;

@interface YLYRootTextField : UITextField

/**
 * @brief 快速创建 textField
 */
+ (YLYRootTextField *)createTextFieldPlaceHolder:(NSString *)placeHolder
                                       fontFloat:(CGFloat)fontFloat
                                       textColor:(UIColor *)textColor;


@end
