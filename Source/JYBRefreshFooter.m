//
//  JYBRefreshFooter.m
//  TradeBook
//
//  Created by Duke on 2018/11/12.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "JYBRefreshFooter.h"
#import "Masonry.h"

const CGFloat kHeight = 44;

@interface JYBRefreshFooter()

@property (nonatomic, strong) UILabel *label;

@end

@implementation JYBRefreshFooter {
    __weak NSObject *_target;
    SEL _action;
    UIImageView *_imageView;
    UIGestureRecognizerState _panState;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
//        _label.textColor = deepSkinGrayColor(1);
        _label.font = [UIFont systemFontOfSize:12];
//        _label.text = TBLocalizedStringForKey(@"上拉加载");
    }
    return _label;
}

+ (instancetype)footerWithRefreshingTarget:(id)target action:(SEL)action {
    return [[JYBRefreshFooter alloc] initWithTarget:target action:action];
}

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    if (self = [super initWithFrame:CGRectZero]) {
        _target = target;
        _action = action;
        self.hidden = YES;
        [self initSubviews];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    UIEdgeInsets insets = self.scrollView.contentInset;
    insets.bottom -= kHeight;
    self.scrollView.contentInset = insets;
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    UIEdgeInsets insets = self.scrollView.contentInset;
    insets.bottom += kHeight;
    self.scrollView.contentInset = insets;
    [self resetFrame];
}

- (void)resetFrame {
    CGFloat y = self.scrollView.contentSize.height;
    CGFloat width = self.scrollView.bounds.size.width;
    self.frame = CGRectMake(0, y, width, kHeight);
}

- (void)initSubviews {
    [self addSubview:self.label];
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)scrollView:(UIScrollView *)scrollView contentOffsetDidChange:(NSDictionary *)change {
    CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
    if (offset.y <= 0) { return; }
    CGFloat offsetHeight = offset.y + scrollView.bounds.size.height - scrollView.contentSize.height - scrollView.contentInset.top - scrollView.contentInset.bottom;
    if (offsetHeight >= 0) {
        [self beginRefreshing];
    } else if (offsetHeight >= -kHeight) {
        _imageView.transform = CGAffineTransformMakeRotation(M_PI*offsetHeight/kHeight);
    }
}

- (void)scrollView:(UIScrollView *)scrollView contentSizeDidChange:(NSDictionary *)change {
    CGSize size = [change[NSKeyValueChangeNewKey] CGSizeValue];
    [self resetFrame];
}

- (void)scrollView:(UIScrollView *)scrollView contentInsetDidChange:(NSDictionary *)change {
    UIEdgeInsets insets = [change[NSKeyValueChangeNewKey] UIEdgeInsetsValue];
    [self resetFrame];
}

- (void)scrollView:(UIScrollView *)scrollView panStateDidChange:(NSDictionary *)change {
    _panState = [change[NSKeyValueChangeNewKey] integerValue];
}

- (void)setState:(JYBRefreshState)state {
    super.state = state;
    switch (state) {
        case JYBRefreshStateIdle:
//            _label.text = TBLocalizedStringForKey(@"上拉加载");
            _imageView.hidden = NO;
            break;
        case JYBRefreshStateRefreshing:
//            _label.text = TBLocalizedStringForKey(@"加载中...");
            _imageView.hidden = NO;
            break;
        case JYBRefreshStateNoMoreData:
//            _label.text = TBLocalizedStringForKey(@"无更多数据");
            _imageView.hidden = YES;
            break;
        default:
            break;
    }
}

- (void)noMoreData {
    self.state = JYBRefreshStateNoMoreData;
    self.hidden = NO;
}

- (void)beginRefreshing {
    if (self.state != JYBRefreshStateIdle) { return; }
    self.state = JYBRefreshStateRefreshing;
    if ([_target respondsToSelector:_action]) {
        [_target performSelector:_action];
    }
}

- (void)endRefreshing {
    self.hidden = NO;
    if (self.state != JYBRefreshStateRefreshing) { return; }
    self.state = JYBRefreshStateIdle;
}

- (void)reset {
    self.hidden = NO;
    self.state = JYBRefreshStateIdle;
}

@end
