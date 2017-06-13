//
//  NSMutableArray+DDSafe.h
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (DDSafe)

- (void)safeAddObject:(id)obj;
- (void)safeRemoveFirstObject;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
