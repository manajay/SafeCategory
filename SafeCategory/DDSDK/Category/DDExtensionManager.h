//
//  DDExtensionManager.h
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ENABLE_SAFE ([DDExtensionManager sharedInstance].enableSafeOperation)

@interface DDExtensionManager : NSObject
+ (DDExtensionManager *)sharedInstance;

/**
 是否开启安全过滤操作;YES-打开,NO-关闭     
 @warning 调试阶段应该将该功能关闭,以写出最优代码,上线后再将其打开.
 */
@property(nonatomic,assign) BOOL enableSafeOperation;

@end
