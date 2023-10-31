//
//  BlockDemo1ViewController.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/30.
//

#import "BlockDemo1ViewController.h"
#import "BlockView.h"

@interface BlockDemo1ViewController ()

@end

@implementation BlockDemo1ViewController {
    BlockView *_blockView;
    UIButton *_button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Block";
    // systemBackgroundColor 用于适配黑暗模式
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    __weak typeof(self) weakSelf = self;
    _blockView = [[BlockView alloc] initWithFrame:CGRectMake(0, 80, 80, 200)];
    _blockView.updateSpeedBlock = ^(int speed) {
        NSLog(@"speed = %i", speed);
//            __typeof(self) strongSelf = weakSelf;
        __strong typeof(weakSelf) strongSelf = weakSelf;
        // Exception: EXC_BAD_ACCESS (code=1, address=0x4)
        [self->_button setTitle:[NSString stringWithFormat:@"%dx", speed] forState:UIControlStateNormal];
//            strongSelf.infoLabel.text = @"jjj";
//            _blockView.hidden = YES;
//            [strongSelf test];
    };
    [self.view addSubview:_blockView];

    // 创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 200, 50);
    [button setTitle:@"点击按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // 添加按钮到视图
    [self.view addSubview:button];
    _button = button;
}

// 点击事件处理方法
- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"按钮被点击了");
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
