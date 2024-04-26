//
//  ViewController.m
//  testPodTr111
//
//  Created by DerrickMac on 2024/1/29.
//

#import "ViewController.h"
#import "BaseTableView.h"
//#import "UIColor+YYAdd.h"

@interface ViewController ()
@property (nonatomic, strong) BaseTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSObject *viewController = [[CTMediator sharedInstance] A_Category_Objc_ViewControllerWithCallback:^(NSString *result) {
//        NSLog(@"result===%@", result);
//    }];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.frame;
}

- (BaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
//        _tableView.backgroundColor = UIColorHex(#F0F2F9);
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 54;
//        _tableView.noDataView.noDataStr = TBLocalizedStringForKey(Search_mqzwxggp);
//        _tableView.noDataView.backgroundColor = UIColorHex(#F0F2F9);
//        _tableView.tableFooterView = self.clearFooter;
    }
    return _tableView;
}

@end
