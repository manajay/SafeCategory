//
//  NSDictionary+DDSafe.h
//  DingDing
//
//  Created by manajay on 2017/5/25.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DDSafe)
- (NSNumber *)safeNumberForKey:(NSString *)key;
- (NSNumber *)safeNumberOrNilForKey:(NSString *)key;

- (NSString *)safeStringForKey:(NSString *)key;
- (NSString *)safeStringOrNilForKey:(NSString *)key;

- (NSArray *)safeArrayForKey:(NSString *)key;
- (NSDictionary *)safeDictionaryForKey:(NSString *)key;
@end
