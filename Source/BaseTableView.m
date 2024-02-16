//
//  BaseTableView.m
//  TradeBook
//
//  Created by Duke on 2018/10/10.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView {
    TGNoDataView *_noDataView;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        if (@available(iOS 15.0, *)) {
           self.sectionHeaderTopPadding = 0;
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        if (@available(iOS 15.0, *)) {
           self.sectionHeaderTopPadding = 0;
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (@available(iOS 15.0, *)) {
           self.sectionHeaderTopPadding = 0;
        }
    }
    return self;
}

- (TGNoDataView *)noDataView {
    if (!_noDataView) {
        _noDataView = [TGNoDataView new];
    }
    return _noDataView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    _noDataView.frame = self.frame;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview) {
        [self.superview addSubview:self.noDataView];
//        [_noDataView makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.top.bottom.equalTo(self);
//        }];
    }
}

@end
