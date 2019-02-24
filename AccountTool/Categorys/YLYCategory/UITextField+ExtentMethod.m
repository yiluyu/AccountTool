//
//  UITextField+ExtentMethod.m
//  Eyuemeiche
//
//  Created by yu on 24/02/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import "UITextField+ExtentMethod.h"
#import "NSString+ExtendMethod.h"

@implementation UITextField (ExtentMethod)

/* iOS 11 内存无法释放问题 */
- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    //iOS 11新增的一个 provider 成员变量，会强引用textField自身，造成无法释放的问题。
    if (@available(iOS 11.2, *)) {
        NSString *keyPath = @"textContentView.provider";
        @try {
            if (self.window) {
                id provider = [self valueForKeyPath:keyPath];
                if (!provider && self) {
                    [self setValue:self forKeyPath:keyPath];
                }
            } else {
                [self setValue:nil forKeyPath:keyPath];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
    }
}

/* 快速创建 */
+ (UITextField *)createTextFieldPlaceHolder:(NSString *)placeHolder fontFloat:(CGFloat)fontFloat textColor:(UIColor *)textColor {
    UITextField *tempTextField = [[UITextField alloc] init];
    tempTextField.placeholder = [NSString safeString:placeHolder];
    tempTextField.font = [UIFont systemFontOfSize:(fontFloat > 0)? fontFloat : 8];
    tempTextField.textColor = textColor;
    
    return tempTextField;
}

@end
