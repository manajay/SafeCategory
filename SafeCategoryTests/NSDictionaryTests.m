//
//  NSDictionaryTests.m
//  SafeCategory
//
//  Created by manajay on 13/06/2017.
//  Copyright © 2017 ddtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDExtensionManager.h"
#import "NSDictionary+DDSafe.h"

@interface NSDictionaryTests : XCTestCase
@property (nonatomic,strong) NSDictionary *testDict;
@end

@implementation NSDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [DDExtensionManager sharedInstance].enableSafeOperation = YES;
    self.testDict = @{@"key1":  @1,
                       @"key2": @2,
                       @"key3": @3,
                       @"key4": @4,
                       @"key5": @5,
                       @"str" : @"string",
                       @"null": [NSNull null]};

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self testNSDictionary_DDSafe_safeNumberForKey];
    [self testNSDictionary_DDSafe_safeNumberOrNilForKey];
    [self testNSDictionary_DDSafe_safeStringForKey];
    [self testNSDictionary_DDSafe_safeStringOrNilForKey];
    [self testNSDictionary_DDSafe_safeArrayForKey];
    [self testNSDictionary_DDSafe_safeDictionaryForKey];
}

- (void)testNSDictionary_DDSafe_safeNumberForKey{
    NSNumber *nullNumber = [self.testDict safeNumberForKey:@"null"];
    XCTAssertEqual(nullNumber, @0, @"字典获取 数值 对象出现问题");
    NSNumber *strNumber = [self.testDict safeNumberForKey:@"str"];
    XCTAssertEqual(strNumber,  @0, @"字典获取 数值 对象出现问题");
}

- (void)testNSDictionary_DDSafe_safeNumberOrNilForKey{
    NSNumber *nilNumber = [self.testDict safeNumberOrNilForKey:@"null"];
    XCTAssertNil(nilNumber,@"字典获取 数值 对象出现问题");
}

- (void)testNSDictionary_DDSafe_safeStringForKey{
    NSString *emptyNullStr = [self.testDict safeStringForKey:@"null"];
    XCTAssertTrue([emptyNullStr isEqualToString:@""], @"字典获取 字符串 对象出现问题");
    NSString *emptyNumberStr = [self.testDict safeStringForKey:@"key1"];
    XCTAssertTrue([emptyNumberStr isEqualToString:@""], @"字典获取 字符串 对象出现问题");
}

- (void)testNSDictionary_DDSafe_safeStringOrNilForKey{
    NSString *nilNullStr = [self.testDict safeStringOrNilForKey:@"null"];
    XCTAssertNil(nilNullStr,@"字典获取 字符串 对象出现问题");
    NSString *nilNumberStr = [self.testDict safeStringOrNilForKey:@"key1"];
    XCTAssertNil(nilNumberStr,@"字典获取 字符串 对象出现问题");
}

- (void)testNSDictionary_DDSafe_safeArrayForKey{
    NSArray *nilArray = [self.testDict safeArrayForKey:@"null"];
    XCTAssertNil(nilArray,@"字典获取 数组 对象出现问题");
    NSArray *nilNumberArray = [self.testDict safeArrayForKey:@"key1"];
    XCTAssertNil(nilNumberArray,@"字典获取 数组 对象出现问题");
}

- (void)testNSDictionary_DDSafe_safeDictionaryForKey{
    NSDictionary *nilDict = [self.testDict safeDictionaryForKey:@"null"];
    XCTAssertNil(nilDict,@"字典获取 字典 对象出现问题");
    NSDictionary *nilNumberDict = [self.testDict safeDictionaryForKey:@"key1"];
    XCTAssertNil(nilNumberDict,@"字典获取 字典 对象出现问题");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
