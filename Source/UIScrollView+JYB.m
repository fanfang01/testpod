//
//  UIScrollView+JYB.m
//  TradeBook
//
//  Created by Duke on 2018/11/13.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "UIScrollView+JYB.h"
#import <objc/runtime.h>
#import "JYBRefreshFooter.h"

@implementation UIScrollView (JYB)

- (void)setJyb_footer:(nullable JYBRefreshFooter *)jyb_footer {
    if ([jyb_footer isKindOfClass:NSNull.class]) {
        jyb_footer = nil;
    }
    [self.jyb_footer removeFromSuperview];
    [self addSubview:jyb_footer];
    [self willChangeValueForKey:@"jyb_footer"];
    objc_setAssociatedObject(self, @selector(setJyb_footer:), jyb_footer, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"jyb_footer"];
}

- (nullable JYBRefreshFooter *)jyb_footer {
    return objc_getAssociatedObject(self, @selector(setJyb_footer:));
}

- (UIImage *)screenshot {
    UIGraphicsBeginImageContextWithOptions(self.contentSize, YES, [UIScreen mainScreen].scale);
    for (UIView *view in self.subviews) {
        [view drawViewHierarchyInRect:view.frame afterScreenUpdates:YES];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 为了使scroll不能滑动的时候点击空白区域也可以收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self isMemberOfClass:[UIScrollView class]] == NO) {
        return;
    }
    [[self nextResponder] touchesBegan:touches withEvent:event];
    if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
        [super touchesBegan:touches withEvent:event];
    }
}

@end
