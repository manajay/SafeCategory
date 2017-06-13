//
//  NSNumber+DDSafeComparser.m
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "NSNumber+DDSafeComparser.h"

@implementation NSNumber (DDSafeComparser)
- (BOOL)isSafeEqualToNumber:(NSNumber *)aNumber
{
    if ( aNumber )
    {
        return [self isEqualToNumber:aNumber];
    }
    return NO;
}
@end
