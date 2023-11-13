//
//  GCDDemo1ViewController.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/11/10.
//

#import "GCDDemo1ViewController.h"

@interface GCDDemo1ViewController ()

@end

@implementation GCDDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)dispatchAsyncMainQueueTouchDown:(id)sender {
    NSLog(@"0");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"3");
    });
    NSLog(@"4");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"5");
    });
    NSLog(@"6");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"7");
    });
    NSLog(@"8");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"9");
    });
    NSLog(@"10");
}

- (IBAction)dispatchSyncMainQueueTouchDown:(id)sender {
    NSLog(@"0");
    // 原因在于当前代码执行的是主线程，dispatch_sync函数阻塞了主线程，由于主队列是串行队列，而且主队列只能在主线程执行，这时候就出现了主队列block等待主线程往下执行，而主线程正在阻塞等待主队列的block执行完才能执行，出现了循环等待，导致死锁。
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"3");
    });
    NSLog(@"4");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"5");
    });
    NSLog(@"6");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"7");
    });
    NSLog(@"8");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"9");
    });
    NSLog(@"10");
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
