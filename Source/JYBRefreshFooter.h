//
//  JYBRefreshFooter.h
//  TradeBook
//
//  Created by Duke on 2018/11/12.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "JYBRefreshComponent.h"
#import "UIScrollView+JYB.h"

NS_ASSUME_NONNULL_BEGIN

@interface JYBRefreshFooter : JYBRefreshComponent

+ (instancetype)footerWithRefreshingTarget:(id)target action:(SEL)action;

- (void)noMoreData;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
