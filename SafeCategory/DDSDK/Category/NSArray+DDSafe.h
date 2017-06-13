//
//  NSArray+DDSafe.h
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DDSafe)
- (id)safeObjectAtIndex:(NSUInteger)index;
@end
