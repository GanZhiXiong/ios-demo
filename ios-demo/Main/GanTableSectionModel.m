//
// Created by ganzhixiong on 2023/10/30.
//

#import "GanTableSectionModel.h"

@implementation GanTableItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle viewControllerName:(NSString *)name {
    GanTableItem *model = [[self alloc] init];
    model.title = title;
    model.subTitle = subTitle;
    model.viewControllerName = name;
    return model;
}

@end

@implementation GanTableSectionModel

+ (instancetype)sectionModeWithTitle:(NSString *)title items:(NSArray <GanTableItem *> *)items {
    GanTableSectionModel *sectionModel = [[self alloc] init];
    sectionModel.title = title;
    sectionModel.items = items;
    return sectionModel;
}

@end