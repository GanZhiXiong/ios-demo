//
//  JsonTests.m
//  ios-demoTests
//
//  Created by ganzhixiong on 2023/11/13.
//

#import <XCTest/XCTest.h>
#import "NativeMessage.h"
#import "NSObject+JSONTool.h"

@interface JsonTests : XCTestCase

@end

@implementation JsonTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testModel2JsonExample{
    NSError *error;
    NativeMessage *nativeMessage = [[NativeMessage alloc] initWithCode:0 level:@"info" message:@"hello123"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nativeMessage options:NSJSONWritingPrettyPrinted error:&error];

    if (jsonData) {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString = %@", jsonString);

        // jsonString 就是转换后的 JSON 字符串
//        [FPPBatteryPlusPlugin sharedInstance].eventSink(jsonString);
    } else {
        NSLog(@"JSON serialization error: %@", error);
    }
}

-(void)testModel2JsonExample1 {
    NativeMessage *nativeMessage = [[NativeMessage alloc] initWithCode:0 level:@"info" message:@"hello123"];
    NSLog(@"[nativeMessage JSONString]  = %@", [nativeMessage JSONString]);
}

-(void)testModel2JsonExample2 {
    NativeMessage *nativeMessage = [[NativeMessage alloc] initWithCode:0 level:@"info" message:@"hello123"];
    NSMutableDictionary *dict = @{
        @"code": @(nativeMessage.code),
        @"level": nativeMessage.level,
        @"message": nativeMessage.message,
    };
    NSLog(@"[nativeMessage JSONString]  = %@", [dict JSONString]);
}

-(void)testModel2JsonExample3 {
    NativeMessage *nativeMessage = [[NativeMessage alloc] initWithCode:0 level:@"info" message:@"hello123"];
    NSLog(@"[nativeMessage JSONString]  = %@", [nativeMessage.dictionary JSONString]);
}

-(void)testModel2JsonExample4 {
    NativeMessage *nativeMessage = [[NativeMessage alloc] initWithMessage:@"hello world"];
    NSLog(@"[nativeMessage JSONString]  = %@", [nativeMessage.dictionary JSONString]);
}


@end
