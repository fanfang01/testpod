//
//  BaseVC.h
//  TradeBook
//
//  Created by Duke on 2018/7/26.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kBaseNavigationTitleColorKey = @"TitleColor";
static NSString * const kBaseNavigationBackgroundColorKey = @"BackgroundColor";

@interface BaseVC : UIViewController

@property (nonatomic, assign) BOOL hideNavBar;

// 个股不能再设置导航颜色
@property (nonatomic, assign) BOOL noneSetNavbackgroundColor;

/// 固定的导航栏颜色配置
/// TitleColor : 文字颜色
/// BackgroundColor : 背景色
@property (nonatomic,   copy) NSDictionary <NSString *, UIColor *> *fixedNavigationStyleDict;

- (void)popBack;
- (void)resetLeftBarButtonItem;

//有些页面需要单独设置title颜色
- (void)setTitleWhiteColor;
//有些页面需要单独设置返回按钮颜色
- (void)resetLeftBarDeepButtonItem;

@end
