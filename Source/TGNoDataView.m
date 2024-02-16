//
//  TGNoDataView.m
//  TradeBook
//
//  Created by Duke on 2018/8/16.
//  Copyright © 2018年 ethan. All rights reserved.
//

#import "TGNoDataView.h"

@interface TGNoDataView ()
@property (nonatomic, assign) BOOL isNoData;
@end

@implementation TGNoDataView

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [UILabel new];
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.textColor = UIColorHex(#8A929E);
        _descLabel.text = TBLocalizedStringForKey(@"");
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (UIButton *)refreshBtn {
    if (!_refreshBtn) {
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _refreshBtn.clipsToBounds = YES;
        _refreshBtn.layer.cornerRadius = 3;
        [_refreshBtn setBackGroundColor:JYBColor_Blue forState:UIControlStateNormal];
        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_refreshBtn setTitle:TBLocalizedStringForKey(@"点击刷新") forState:UIControlStateNormal];
    }
    return _refreshBtn;
}

- (UIImage *)noDataImage {
    if (!_noDataImage) {
        _noDataImage = [UIImage imageNamed:imageNameDealWithSkin(@"empty_nodata")];
    }
    return _noDataImage;
}

- (UIImage *)errorImage {
    if (!_errorImage) {
        _errorImage = [UIImage imageNamed:imageNameDealWithSkin(@"empty_load_error")];
    }
    return _errorImage;
}

/// 无网络
- (UIImage *)noNetImage {
    if (!_noNetImage) {
        _noNetImage = [UIImage imageNamed:imageNameDealWithSkin(@"empty_no_network")];
    }
    return _noNetImage;
}

#pragma mark - LifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.backgroundColor = deepSkinControlBackGroundColor;
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [self addSubview:self.descLabel];
        [self addSubview:self.refreshBtn];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(_descLabel.top).offset(-25);
        }];
        [_descLabel makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.left.mas_greaterThanOrEqualTo(10);
            make.right.mas_lessThanOrEqualTo(-10);
        }];
        [_refreshBtn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_descLabel.bottom).offset(25);
            make.height.equalTo(40);
            make.width.equalTo(110);
        }];
    }
    return self;
}

- (void)changeSkinToWhite {
    self.backgroundColor = [UIColor whiteColor];
    _noDataImage = [UIImage imageNamed:@"empty_nodata"];
    _errorImage = [UIImage imageNamed:@"empty_load_error"];
}

- (void)changeSkin {
    self.backgroundColor = deepSkinControlBackGroundColor;
    _noDataImage = [UIImage imageNamed:imageNameDealWithSkin(@"empty_nodata")];
    _errorImage = [UIImage imageNamed:imageNameDealWithSkin(@"empty_load_error")];
    if (_isNoData) {
        _imageView.image = self.noDataImage;
    } else {
        _imageView.image = self.errorImage;
    }
}

- (void)notifyNoData {
    self.hidden = NO;
    if (_noDataStr) {
        _descLabel.text = _noDataStr;
    } else {
        _descLabel.text = TBLocalizedStringForKey(Network_zwxgsj);
    }
    _refreshBtn.hidden = YES;
    _imageView.image = self.noDataImage;
    _isNoData = YES;
    CGSize labelSize = [self.descLabel sizeThatFits:CGSizeZero];
    if (self.noDataImage.size.height + 25 + labelSize.height * 0.5 > CGRectGetHeight(self.frame) * 0.5) { // 超过了原先的约束
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        CGFloat topPadding = 0;
        if (self.noDataImage.size.height + 25 + 20 < CGRectGetHeight(self.frame)) { // 还在一屏内
            topPadding = (CGRectGetHeight(self.frame) - (self.noDataImage.size.height + 25 + 20)) / 2;
            if (topPadding < 0) {
                topPadding = 0;
            }
        }
        // 计算image高度
        CGFloat imgHeight = CGRectGetHeight(self.frame) - topPadding * 2 - 25 - 20;
        if (imgHeight > self.noDataImage.size.height) {
            imgHeight = self.noDataImage.size.height;
        } else if (imgHeight < 0) {
            imgHeight = self.noDataImage.size.height;
        }
        [_imageView remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.mas_equalTo(imgHeight);
            make.top.mas_equalTo(topPadding);
        }];
        [_descLabel remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_imageView.mas_bottom).offset(25);
            make.height.mas_equalTo(20);
        }];
    }
}

- (void)notifyError {
    // 无网络
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown ||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus ==AFNetworkReachabilityStatusNotReachable){
        self.hidden = NO;
        self.descLabel.text = TBLocalizedStringForKey(Network_jzyc);
        _refreshBtn.hidden = NO;
        _imageView.image = self.noNetImage;
        _isNoData = NO;
    }else{
        self.hidden = NO;
        self.descLabel.text = TBLocalizedStringForKey(@"加载异常，请刷新重试");
        _refreshBtn.hidden = NO;
        _imageView.image = self.errorImage;
        _isNoData = NO;
    }
}


#pragma mark 小图 90x90
// 容器最小高度为120
- (void)notifyNoDataSmall {
    self.hidden = NO;
    if (_noDataStr) {
        _descLabel.text = _noDataStr;
    } else {
        _descLabel.text = TBLocalizedStringForKey(Network_zwxgsj);
    }
    _refreshBtn.hidden = YES;
    _imageView.image = self.noDataImage;
    _isNoData = YES;
    CGSize imgSize = CGSizeMake(90.0, 90.0);
    CGFloat descLabelHeight = 20.0;
    CGFloat spacing = 10.0; // 控件间距
    CGFloat padding = (CGRectGetHeight(self.frame) - imgSize.height - descLabelHeight - spacing) / 2.0;
    [_imageView remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(imgSize);
        make.top.mas_equalTo(padding);
    }];
    [_descLabel remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_imageView.mas_bottom).offset(spacing);
        make.height.mas_equalTo(descLabelHeight);
    }];
}

// 只显示文字
- (void)notifyNoDataSmallOnlyText {
    self.hidden = NO;
    if (_noDataStr) {
        _descLabel.text = _noDataStr;
    } else {
        _descLabel.text = TBLocalizedStringForKey(Network_zwxgsj);
    }
    _descLabel.textColor = AppDelegate.deepSkin ? UIColorHex(#666B74) : UIColorHex(#A6A9B6);
    _refreshBtn.hidden = YES;
    _imageView.hidden = YES;
    _isNoData = YES;
    [_descLabel remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}
@end

