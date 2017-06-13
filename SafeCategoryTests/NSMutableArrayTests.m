//
//  NSMutableArrayTests.m
//  SafeCategory
//
//  Created by manajay on 13/06/2017.
//  Copyright © 2017 ddtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDExtensionManager.h"
#import "NSMutableArray+DDSafe.h"
#import "NSArray+DDSafe.h"

@interface NSMutableArrayTests : XCTestCase
@property (nonatomic,strong) NSMutableArray *testMArray;
@end

@implementation NSMutableArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [DDExtensionManager sharedInstance].enableSafeOperation = YES;
    self.testMArray = @[@"1",@"2",@"3",@"4",@"5"].mutableCopy;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self testNSArrayDDSafe_safeObjectAtIndex];
    [self testNSMutableArrayDDSafe_safeAddObject];
    [self testNSArrayDDSafe_safeRemoveFirstObject];
    [self testNSArrayDDSafe_safeRemoveObjectAtIndex];
    [self testNSArrayDDSafe_safeReplaceObjectAtIndex_withObject];
}

- (void)testNSArrayDDSafe_safeObjectAtIndex {
    NSString *outRangeStr = [self.testMArray safeObjectAtIndex:self.testMArray.count];
    XCTAssertNil(outRangeStr,@"越界获取的元素不为nil, 方法错误");
    NSLog(@"outRangeStr: %@",outRangeStr);
}

- (void)testNSMutableArrayDDSafe_safeAddObject{
    [self.testMArray safeAddObject:nil];
}

- (void)testNSArrayDDSafe_safeRemoveFirstObject{
    NSMutableArray *emptyArray = @[].mutableCopy;
    [emptyArray safeRemoveFirstObject];
}

- (void)testNSArrayDDSafe_safeRemoveObjectAtIndex{
    [self.testMArray safeRemoveObjectAtIndex:self.testMArray.count];
}

- (void)testNSArrayDDSafe_safeReplaceObjectAtIndex_withObject{
    [self.testMArray safeReplaceObjectAtIndex:self.testMArray.count withObject:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

//禁止一个测试用例，我们只需要在方法名字前加 DISABLED
