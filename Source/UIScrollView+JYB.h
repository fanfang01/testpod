//
//  UIScrollView+JYB.h
//  TradeBook
//
//  Created by Duke on 2018/11/13.
//  Copyright © 2018 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JYBRefreshFooter;

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (JYB)

@property (nonatomic) JYBRefreshFooter * _Nullable jyb_footer;

- (UIImage *)screenshot;

@end

NS_ASSUME_NONNULL_END
