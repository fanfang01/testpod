//
//  JYBRefreshComponent.h
//  TradeBook
//
//  Created by Duke on 2018/11/12.
//  Copyright © 2018 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JYBRefreshState) {
    JYBRefreshStateIdle,
    JYBRefreshStatePulling,
    JYBRefreshStateWillRefresh,
    JYBRefreshStateRefreshing,
    JYBRefreshStateNoMoreData
};

NS_ASSUME_NONNULL_BEGIN

@interface JYBRefreshComponent : UIView

@property (assign, nonatomic) JYBRefreshState state;
@property (readonly) UIScrollView *scrollView;

- (void)beginRefreshing;
- (void)endRefreshing;

- (void)scrollView:(UIScrollView *)scrollView contentOffsetDidChange:(NSDictionary *)change;
- (void)scrollView:(UIScrollView *)scrollView contentSizeDidChange:(NSDictionary *)change;
- (void)scrollView:(UIScrollView *)scrollView contentInsetDidChange:(NSDictionary *)change;
- (void)scrollView:(UIScrollView *)scrollView panStateDidChange:(NSDictionary *)change;

@end

NS_ASSUME_NONNULL_END
