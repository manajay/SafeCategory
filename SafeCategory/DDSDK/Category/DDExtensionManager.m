//
//  DDExtensionManager.m
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "DDExtensionManager.h"

@implementation DDExtensionManager
+ (DDExtensionManager *)sharedInstance
{
    static DDExtensionManager *_shareInstance = nil;
    static  dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        _shareInstance = [[DDExtensionManager alloc] init];
    });
    return _shareInstance;
}
@end
