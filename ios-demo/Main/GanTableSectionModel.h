//
// Created by ganzhixiong on 2023/10/30.
//

#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GanTableItem : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subTitle;
@property(nonatomic, copy) NSString *viewControllerName;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle viewControllerName:(NSString *)name;

@end

@interface GanTableSectionModel : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSArray <GanTableItem *> *items;

+ (instancetype)sectionModeWithTitle:(NSString *)title items:(NSArray <GanTableItem *> *)items;

@end

NS_ASSUME_NONNULL_END