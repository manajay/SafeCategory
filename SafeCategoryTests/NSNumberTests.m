//
//  NSNumberTests.m
//  SafeCategory
//
//  Created by manajay on 13/06/2017.
//  Copyright © 2017 ddtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDExtensionManager.h"
#import "NSNumber+DDSafeComparser.h"

@interface NSNumberTests : XCTestCase

@end

@implementation NSNumberTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [DDExtensionManager sharedInstance].enableSafeOperation = YES;

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self testNSNumber_DDSafeComparser_isSafeEqualToNumber];
}

- (void)testNSNumber_DDSafeComparser_isSafeEqualToNumber{
    [@1 isSafeEqualToNumber:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
