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

@property(nonatomic,assign) BOOL enableSafeOperation;

@end
