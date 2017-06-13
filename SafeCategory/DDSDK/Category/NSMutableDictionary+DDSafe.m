//
//  NSMutableDictionary+DDSafe.m
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "NSMutableDictionary+DDSafe.h"

@implementation NSMutableDictionary (DDSafe)
- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (anObject != nil && aKey != nil) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
