//
//  BlockView.h
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^UpdateSpeedBlock)(int);

@interface BlockView : UIView

@property (nonatomic, copy) UpdateSpeedBlock updateSpeedBlock;

@end

NS_ASSUME_NONNULL_END
