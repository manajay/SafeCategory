# SafeCategory
an easy way to deal with some dangerous actions of NSArray , NSDictionary , NSNumber,NSString...

### Usage 

下面的代码都可以在`SafeCategoryTests` 单元测试的文件里面找到

#####  DDExtensionManager 安全操作的管理者

* `enableSafeOperation` 是否开启安全过滤操作;`YES`-打开,`NO`-关闭
* 调试阶段应该将该功能关闭,以写出最优代码,上线后再将其打开.

```Obj-c
[DDExtensionManager sharedInstance].enableSafeOperation = YES;
```
#####  NSArray+DDSafe


```

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

```

##### NSDictionary+DDSafe


```
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

```

##### NSMutableArray+DDSafe 

```
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
```
##### NSMutableDictionary+DDSafe


```
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
```
##### NSNumber+DDSafeComparser


```
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
```
##### NSString+DDSafe

* 待补充

#### 额外的工具

* NSArray+DDLog
* NSDictionary+DDLog
* NSString+DDLog

用来打印中文字符

