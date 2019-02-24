//
//  YLYNetBox.h
//  Eyuemeiche
//
//  Created by yu on 15/03/2018.
//  Copyright © 2018 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface YLYNetBox : NSObject

@property (nonatomic, readwrite, strong)AFHTTPSessionManager *manager; // AFN manager
@property (nonatomic, readwrite, weak)id viewController; // 发起请求的对象

@property (nonatomic, readonly, copy)NSString *requestName;//请求名称
@property (nonatomic, readonly, copy)NSString *requestTag;//请求 number 标记

/// 请求成功block
@property (nonatomic, readwrite, copy)void (^requestSuccessBlock)(NSDictionary *dic);
/// 其他block
@property (nonatomic, readwrite, copy)void (^requestOtherBlock)(NSDictionary *dic);
/// 请求失败block
@property (nonatomic, readwrite, copy)void (^requestFailedBlock)(void);
/// 请求中处理block
@property (nonatomic, readwrite, copy)void (^requestProcessBlock)(NSProgress *uploadProgress);
/// 取消block
@property (nonatomic, readwrite, copy)void (^requestCancelBlock)(void);

/// DownLoadManager管理回调
@property (nonatomic, readwrite, copy)void (^requestDown)(id sender, YLYNetBox *netBox);

/**
 * @brief 发送请求
 * @param address 接口名
 * @param paramDict 参数
 * @param urlTag 接口对应数字编号
 * @param urlName 自定义接口名字
 */
- (void)sendRequestWithAddress:(NSString *)address
                     paramDict:(NSDictionary *)paramDict
                           tag:(NSString *)urlTag
                          name:(NSString *)urlName;

/// 取消请求
- (void)cancelRequest;


@end
