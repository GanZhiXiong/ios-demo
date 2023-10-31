//
//  BasicsViewController.m
//  ios-demo
//
//  Created by ganzhixiong on 2023/10/30.
//

#import "BasicsViewController.h"
#import "GanTableSectionModel.h"
#import "GanSubtitleTableViewCell.h"

static NSString *kIdentifier = @"kIdentifier";

@interface BasicsViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray <GanTableSectionModel *> *datas;

@end

@implementation BasicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基础";
    [self.view addSubview:self.tableView];
    self.datas = @[].mutableCopy;
    [self.datas addObject:[GanTableSectionModel sectionModeWithTitle:@"多线程" items:[self createThreadItems]]];
    [self.datas addObject:[GanTableSectionModel sectionModeWithTitle:@"Block" items:[self createBlockItems]]];

//    NSLog([NSString stringWithFormat:@"%@x", 123]);
//    NSLog([NSString stringWithFormat:@"%ix", 123]);

    NSString *viewControllerName = @"BlockDemo1ViewController";
    UIViewController *viewController = [[NSClassFromString(viewControllerName) alloc] init];
//    viewController.navigationItem.title = item.title;
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSArray <GanTableItem *> *)createThreadItems {
    return @[[GanTableItem itemWithTitle:@"Thread" subTitle:nil viewControllerName:@"ZFNormalViewController"],
            [GanTableItem itemWithTitle:@"GCD" subTitle:nil viewControllerName:@"ZFAutoPlayerViewController"],
            [GanTableItem itemWithTitle:@"NSOperation" subTitle:nil viewControllerName:@"ZFCollectionViewController"],
            [GanTableItem itemWithTitle:@"NSLock" subTitle:nil viewControllerName:@"ZFScrollViewViewController"]];
}

- (NSArray <GanTableItem *> *)createBlockItems {
    return @[[GanTableItem itemWithTitle:@"Demo1" subTitle:nil viewControllerName:@"BlockDemo1ViewController"],
             [GanTableItem itemWithTitle:@"Demo2" subTitle:nil viewControllerName:@"BlockDemo2ViewController"],
    ];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // iOS6 之后，需要配合 registerClass 使用。
    GanSubtitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
    GanTableItem *item = self.datas[indexPath.section].items[indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subTitle;

    // iOS6 之前
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
//    if ( !cell ) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kIdentifier];
//        GanTableItem *item = self.datas[indexPath.section].items[indexPath.row];
//        cell.textLabel.text = item.title;
//        cell.detailTextLabel.text = item.subTitle;
//    }
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    GanTableItem *item = self.datas[indexPath.section].items[indexPath.row];
//    cell.textLabel.text = item.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@（%@）", item.title, item.subTitle];
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.datas[section].title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GanTableItem *item = self.datas[indexPath.section].items[indexPath.row];
    NSString *vcString = item.viewControllerName;
    UIViewController *viewController = [[NSClassFromString(vcString) alloc] init];
//    if ([vcString isEqualToString:@"ZFDouYinViewController"]) {
//        [(ZFDouYinViewController *)viewController playTheIndex:0];
//    }
    viewController.navigationItem.title = item.title;
    viewController.hidesBottomBarWhenPushed = YES;

//    if ([vcString isEqualToString:@"ZFDouyinCollectionViewController"] && [item.title isEqualToString:@"横向滚动抖音"]) {
//        ZFDouyinCollectionViewController *douyinVC = (ZFDouyinCollectionViewController *)viewController;
//        douyinVC.scrollViewDirection = ZFPlayerScrollViewDirectionHorizontal;
//    }
    if ([vcString isEqualToString:@"ZFFullScreenViewController"]) {
        viewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:viewController animated:NO completion:nil];
    } else {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        // registerClass 是 iOS6 新加的，可以省去 cell 为 nil 的判断。
        // 但是无法通过这种方式设置 cell style，比如无法设置为 UITableViewCellStyleSubtitle
        [_tableView registerClass:[GanSubtitleTableViewCell class] forCellReuseIdentifier:kIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    }
    return _tableView;
}

@end
