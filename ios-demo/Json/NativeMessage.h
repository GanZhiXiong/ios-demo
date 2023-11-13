//
//  NativeMessage.h
//  ios-demo
//
//  Created by ganzhixiong on 2023/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeMessage: NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *message;

- (instancetype)initWithCode:(NSInteger)code level:(NSString *)level message:(NSString *)message;

- (instancetype)initWithMessage:(NSString *)message;

- (NSMutableDictionary *)dictionary;
@end


NS_ASSUME_NONNULL_END
