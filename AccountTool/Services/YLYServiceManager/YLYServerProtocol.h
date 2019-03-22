//
//  YLYServerProtocol.h
//  AccountTool
//
//  Created by yu on 2019/3/21.
//  Copyright © 2019 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YLYServerProtocol <NSObject>

@required
/// 启动服务
- (void)start;

@end
