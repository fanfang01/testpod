//
//  BaseTableView.h
//  TradeBook
//
//  Created by Duke on 2018/10/10.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGNoDataView.h"
#import "UIScrollView+JYB.h"
#import "JYBRefreshFooter.h"

@interface BaseTableView : UITableView

@property (nonatomic, readonly) TGNoDataView *noDataView;

@end
