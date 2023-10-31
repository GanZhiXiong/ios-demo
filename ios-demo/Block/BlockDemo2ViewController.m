//
//  BlockDemo2ViewController.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/31.
//

#import "BlockDemo2ViewController.h"
#import "BlockView.h"

@interface BlockDemo2ViewController ()

@property (weak, nonatomic) IBOutlet BlockView *blockView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation BlockDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Block";
    __weak typeof(self) weakSelf = self;
    self.blockView.updateSpeedBlock = ^(int speed) {
        NSLog(@"speed = %i", speed);
//            __typeof(self) strongSelf = weakSelf;
        __strong typeof(weakSelf) strongSelf = weakSelf;
        // Exception: EXC_BAD_ACCESS (code=1, address=0x4)
        [self.button setTitle:[NSString stringWithFormat:@"%dx", speed] forState:UIControlStateNormal];
//            strongSelf.infoLabel.text = @"jjj";
//            _blockView.hidden = YES;
//            [strongSelf test];
    };

    // 创建按钮
    [self.button setTitle:@"点击按钮" forState:UIControlStateNormal];
}

- (IBAction)buttonTouchDown:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
