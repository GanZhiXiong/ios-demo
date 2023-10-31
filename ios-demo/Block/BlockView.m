//
//  BlockView.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/30.
//

#import "BlockView.h"

@implementation BlockView

- (void)setupView {
    self.backgroundColor = [UIColor blueColor];
    NSArray<NSNumber *> *speedArray = @[@1, @2, @4, @8];
    
    CGFloat labelHeight = (self.frame.size.height - 10) / speedArray.count;
    NSUInteger labelCount = speedArray.count;
    
    for (NSUInteger i = 0; i < labelCount; i++) {
        CGFloat labelY = labelHeight * i;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, labelY, self.frame.size.width, labelHeight)];
        [self addSubview:label];
        
        NSNumber *number = speedArray[labelCount - i - 1];
        label.text = [NSString stringWithFormat:@"%@ x", number];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = number.intValue;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)];
        [label addGestureRecognizer:tapGesture];
        label.userInteractionEnabled = YES; // 允许用户交互
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}

- (void)labelTapped:(UITapGestureRecognizer *)gesture {
    UILabel *tappedLabel = (UILabel *)gesture.view;
    NSLog(@"Label tapped: %@", tappedLabel.text);
    if (self.updateSpeedBlock) {
        self.updateSpeedBlock(tappedLabel.tag);
    }
}

@end
