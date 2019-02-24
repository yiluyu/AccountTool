//
//  YLYDownLoadManager.h
//  TestDemo
//
//  Created by yu on 31/08/2017.
//  Copyright © 2017 yu. All rights reserved.
//

/*
 对请求类 YLYNetBox 进行统一管理
 */

#import <Foundation/Foundation.h>
#import "YLYNetBox.h"

@interface YLYDownLoadManager : NSObject

/**
 * @brief 获取 netManager
 */
+ (instancetype)shareManager;

/**
 * @brief 返回一个YLYNetBox对象
 * @discussion 放在 manager 中进行管理. 需要传入 sender
 * @param sender 发起请求, 处理请求回调对象
 * @return 当前可用的 YLYNetBox
 */
- (YLYNetBox *)createNetBoxWithSender:(id)sender;

/**
 * @brief 清空 sender 下所有请求
 * @param sender 指定对应的业务对象
 */
- (void)clearNetBoxInSender:(id)sender;

@end
