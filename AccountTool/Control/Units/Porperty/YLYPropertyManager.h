//
//  YLYPropertyManager.h
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

/*
 该对象用来暂时存放每一次启动后的临时数据
 */

#import <Foundation/Foundation.h>

@interface YLYPropertyManager : NSObject

+ (instancetype)shareInstance;



//! 是否正在展示登录页面
@property (nonatomic, readwrite, assign)BOOL loginVCShowing;

//! 是否第一次启动
@property (nonatomic, readwrite, assign)BOOL isFirstLaunch;

//! UUID
@property (nonatomic, readwrite, copy)NSString *UUIDString;



@end
