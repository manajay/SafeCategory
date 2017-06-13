//
//  NSArray+DDSafe.m
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "NSArray+DDSafe.h"
#import "DDExtensionManager.h"

@implementation NSArray (DDSafe)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (ENABLE_SAFE) {
        if (index < self.count ) {
            return [self objectAtIndex:index];
        } else {
            return nil;
        }
    } else {
        return [self objectAtIndex:index];
    }
}
@end
