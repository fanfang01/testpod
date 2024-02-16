//
//  TGNoDataView.h
//  TradeBook
//
//  Created by Duke on 2018/8/16.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGNoDataView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *noDataImage;
@property (nonatomic, strong) UIImage *errorImage;
@property (nonatomic, strong) UIImage *noNetImage;

@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, copy) NSString *noDataStr;

@property (nonatomic, strong) UIButton *refreshBtn;

- (void)changeSkinToWhite;
- (void)changeSkin;
- (void)notifyNoData;
- (void)notifyError;

// 容器最小高度为120
- (void)notifyNoDataSmall;

// 只显示文字
- (void)notifyNoDataSmallOnlyText;
@end
