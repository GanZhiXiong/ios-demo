//
//  NSObject+JSONTool.h
//  ios-demo
//
//  Created by ganzhixiong on 2023/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSONTool)

/**
 *  对象转换为JSONData
 *
 *  @return NSData
 */
- (nullable NSData *)JSONData;

/**
 *  对象转换为JSONString
 *
 *  @return NSString
 */
- (nullable NSString *)JSONString;

/**
 *  将JSONString转换为对象
 *
 *  @param jsonString json字符串
 *
 *  @return 对象
 */
+ (nullable id)objectFromJSONString:(nullable NSString *)jsonString;

/**
 *  将JSONString转换为对象
 *
 *  @param jsonString json字符串
 *
 *  @return 对象
 */
+ (nullable id)objectFromJSONData:(nullable NSData *)jsonData;

@end

NS_ASSUME_NONNULL_END
