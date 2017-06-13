//
//  NSArrayTests.m
//  SafeCategory
//
//  Created by manajay on 13/06/2017.
//  Copyright © 2017 ddtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+DDSafe.h"
#import "DDExtensionManager.h"

@interface NSArrayTests : XCTestCase
@property (nonatomic,strong) NSArray *testArray;
@end

@implementation NSArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testArray = @[@1,@2,@3,@4,@5];
    [DDExtensionManager sharedInstance].enableSafeOperation = YES;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.testArray = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSNumber *outRangeNumber = [self.testArray safeObjectAtIndex:self.testArray.count];
    NSLog(@"outRangeNumber: %@",outRangeNumber);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
