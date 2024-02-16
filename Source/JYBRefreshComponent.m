//
//  JYBRefreshComponent.m
//  TradeBook
//
//  Created by Duke on 2018/11/12.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "JYBRefreshComponent.h"

@implementation JYBRefreshComponent {
    UIScrollView *_scrollView;
}

- (UIScrollView *)scrollView {
    return _scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self removeObservers];
    _scrollView = (UIScrollView *)newSuperview;
    if (newSuperview) {
        [self addObservers];
    }
}

#pragma mark - KVO

- (void)addObservers {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    [_scrollView addObserver:self forKeyPath:@"contentSize" options:options context:nil];
    [_scrollView addObserver:self forKeyPath:@"contentInset" options:options context:nil];
    [_scrollView.panGestureRecognizer addObserver:self forKeyPath:@"state" options:options context:nil];
}

- (void)removeObservers {
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [_scrollView removeObserver:self forKeyPath:@"contentSize"];
    [_scrollView removeObserver:self forKeyPath:@"contentInset"];
    [_scrollView.panGestureRecognizer removeObserver:self forKeyPath:@"state"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (!self.userInteractionEnabled || self.hidden || ![object isKindOfClass:UIScrollView.class]) return;
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollView:object contentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:@"contentSize"]) {
        [self scrollView:object contentSizeDidChange:change];
    } else if ([keyPath isEqualToString:@"contentInset"]) {
        [self scrollView:object contentInsetDidChange:change];
    } else if ([keyPath isEqualToString:@"state"]) {
        [self scrollView:object panStateDidChange:change];
    }
}

#pragma mark - Public

- (void)scrollView:(UIScrollView *)scrollView contentOffsetDidChange:(NSDictionary *)change {}
- (void)scrollView:(UIScrollView *)scrollView contentInsetDidChange:(NSDictionary *)change {}
- (void)scrollView:(UIScrollView *)scrollView contentSizeDidChange:(NSDictionary *)change {}
- (void)scrollView:(UIScrollView *)scrollView panStateDidChange:(NSDictionary *)change {}

- (void)beginRefreshing {
    _state = JYBRefreshStateRefreshing;
}

- (void)endRefreshing {
    _state = JYBRefreshStateIdle;
}

@end
