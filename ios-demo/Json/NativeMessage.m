//
//  NativeMessage.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/11/13.
//

#import "NativeMessage.h"

@implementation NativeMessage
- (instancetype)init {
    self = [super init];
    if (self) {
        _code = 0;
        _level = @"info";
    }
    return self;
}

- (instancetype)initWithCode:(NSInteger)code level:(NSString *)level message:(NSString *)message {
    self = [super init];
    if (self) {
        _code = code;
        _level = level.copy;
        _message = message.copy;
    }
    return self;
}

- (instancetype)initWithMessage:(NSString *)message {
    self = [super init];
    if (self) {
        _code = 0;
        _level = @"info";
        _message = message.copy;
    }
    return self;
}

- (NSMutableDictionary *)dictionary {
    NSMutableDictionary *dict = @{
            @"code": @(self.code),
            @"level": self.level,
            @"message": self.message,
    };
    return dict;
}

@end
