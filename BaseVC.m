//
//  BaseVC.m
//  TradeBook
//
//  Created by Duke on 2018/7/26.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import "BaseVC.h"
#import "UIImage+JYB.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = deepSkinControlBackGroundColor;
    [self resetLeftBarButtonItem];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.parentViewController isKindOfClass:UINavigationController.class]) {
        [self.navigationController setNavigationBarHidden:_hideNavBar animated:animated];
    }
    
    [self navigationConfigurationSet];

}

- (void)navigationConfigurationSet {
    if(self.noneSetNavbackgroundColor){
        return;
    }
    //     导航栏不透明
    [self.navigationController.navigationBar setTranslucent:NO];
    
    UIColor *titleColor = deepSkinBlackColor_Version750(1);
    UIImage *backgroundImage = [UIImage navBarImage];
    if ([self.fixedNavigationStyleDict valueForKey:kBaseNavigationTitleColorKey]) {
        titleColor = [self.fixedNavigationStyleDict objectForKey:kBaseNavigationTitleColorKey];
    }
    if ([self.fixedNavigationStyleDict valueForKey:kBaseNavigationBackgroundColorKey]) {
        backgroundImage = [UIImage imageWithColor:[self.fixedNavigationStyleDict valueForKey:kBaseNavigationBackgroundColorKey]];
    }
    
    NSDictionary *attrDic = @{NSForegroundColorAttributeName:titleColor, NSFontAttributeName:meduimFont(18)};
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = [UIColor clearColor];
        appearance.titleTextAttributes = attrDic;
        appearance.largeTitleTextAttributes = attrDic;
        appearance.backgroundImage = backgroundImage;
        appearance.shadowImage = [UIImage zt_imageWithPureColor:[UIColor clearColor]];
        appearance.shadowColor = [UIColor clearColor];
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        [UINavigationBar appearance].standardAppearance = appearance;
        [UINavigationBar appearance].scrollEdgeAppearance = appearance;
    }else {
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        //    设置导航栏字体与颜色
        [self.navigationController.navigationBar setTitleTextAttributes:attrDic];
        //隐藏导航栏与view连接处的分隔线
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    }
}

- (void)reloadNavigationStyle {
    [self navigationConfigurationSet];
}



- (void)resetLeftBarButtonItem {
    UIImage *image = [[UIImage imageNamed:imageNameDealWithSkin(@"navigation_back_white")] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popBack)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setTitleWhiteColor{
    NSDictionary *attrDic = @{NSForegroundColorAttributeName:UIColorFromRGBA(0xCCCCCC, 1), NSFontAttributeName:meduimFont(18)};
    [self.navigationController.navigationBar setTitleTextAttributes:attrDic];
}

- (void)resetLeftBarDeepButtonItem {
    UIImage *image = [[UIImage imageNamed:@"navigation_back_white_deep"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popBack)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)popBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (AppDelegate.deepSkin) {
        return UIStatusBarStyleLightContent;
    } else {
        if (@available(iOS 13.0, *)) {
            return UIStatusBarStyleDarkContent;
        } else {
            return UIStatusBarStyleDefault;
        }
    }
}

- (void)setFixedNavigationStyleDict:(NSDictionary<NSString *,UIColor *> *)fixedNavigationStyleDict {
    _fixedNavigationStyleDict = fixedNavigationStyleDict;
    [self navigationConfigurationSet];
    [self setNeedsStatusBarAppearanceUpdate];
}

@end

