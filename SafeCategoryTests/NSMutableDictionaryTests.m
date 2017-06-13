//
//  NSMutableDictionaryTests.m
//  SafeCategory
//
//  Created by manajay on 13/06/2017.
//  Copyright © 2017 ddtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDExtensionManager.h"
#import "NSMutableDictionary+DDSafe.h"

@interface NSMutableDictionaryTests : XCTestCase
@property (nonatomic,strong) NSMutableDictionary *testMDict;
@end

@implementation NSMutableDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [DDExtensionManager sharedInstance].enableSafeOperation = YES;
    self.testMDict = @{@"key1": @1,
                       @"key2": @2,
                       @"key3": @3,
                       @"key4": @4,
                       @"key5": @5}.mutableCopy;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testNSMutableDictionary_DDSafe_safeSetObject_forKey{
    [self.testMDict safeSetObject:nil forKey:@"key1"];
    [self.testMDict safeSetObject:@1 forKey:nil];
    [self.testMDict safeSetObject:nil forKey:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
