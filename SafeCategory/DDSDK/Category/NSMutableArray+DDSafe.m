//
//  NSMutableArray+DDSafe.m
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "NSMutableArray+DDSafe.h"
#import "DDExtensionManager.h"

@implementation NSMutableArray (DDSafe)

- (BOOL)indexValidate:(NSUInteger)index
{
    return index < self.count;
}

- (void)safeAddObject:(id)obj
{
    if (ENABLE_SAFE) {
        if (obj) {
            [self addObject:obj];
        }
    } else {
        [self addObject:obj];
    }
}

- (void)safeRemoveFirstObject
{
    if (ENABLE_SAFE) {
        if (self.count) {
            [self removeObjectAtIndex:0];
        }
    } else {
        [self removeObjectAtIndex:0];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (ENABLE_SAFE) {
        if ([self indexValidate:index]) {
            [self removeObjectAtIndex:index];
        }
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (ENABLE_SAFE) {
        if ([self indexValidate:index] && anObject != nil) {
            [self replaceObjectAtIndex:index withObject:anObject];
        }
    } else {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (ENABLE_SAFE) {
        if ([self indexValidate:index] && anObject != nil) {
            [self insertObject:anObject atIndex:index];
        }
    } else {
        [self insertObject:anObject atIndex:index];
    }
}
@end
