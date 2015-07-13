//
//  CALoadingView.m
//  CAComApp
//
//  Created by tieshan on 15/4/11.
//  Copyright (c) 2015年 铁山. All rights reserved.
//

#import "CALoadingView.h"

#define CENTER_RECT_HEIGHT          100
#define CENTER_RECT_WIDTH           120

@implementation CALoadingView
- (id)initWithFrame:(CGRect)frame andLoadingPromptString:(NSString *)promptStr
{
    if (self = [super initWithFrame:frame]) {
        _promptStr = promptStr;
        [self addView];
    }
    return self;
}

- (void)addView
{
    self.backgroundColor = CLEAR_COLOR;
    
    //添加中的UIView
    UIView * centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CENTER_RECT_WIDTH, CENTER_RECT_HEIGHT)];
    centerView.backgroundColor = COLOR_FROM_RGB(0, 0, 0, 0.8f);
    centerView.center = CGPointMake([self viewWidth] * 0.5f, [self viewHeight] * 0.5f);
    centerView.layer.cornerRadius = 8.0f;
    centerView.layer.masksToBounds = YES;
    [self addSubview:centerView];
    [centerView release];
    
    _indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _indicator.center = CGPointMake([centerView viewWidth] * 0.5f, [centerView viewHeight] * 0.3f);
    _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [_indicator stopAnimating];
    [centerView addSubview:_indicator];
    [_indicator release];
    
    UILabel * promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [_indicator bottomLeftPos].y, [centerView viewWidth], [centerView viewHeight] - ([_indicator bottomLeftPos].y))];
    promptLabel.backgroundColor = CLEAR_COLOR;
    promptLabel.textColor = WHITE_COLOR;
    promptLabel.font = [UIFont boldSystemFontOfSize:18];
    promptLabel.textAlignment = NSTextAlignmentCenter;
    promptLabel.text = [NSString stringWithFormat:@"%@", _promptStr];
    [centerView addSubview:promptLabel];
    [promptLabel release];
}

- (void)showLoadingViewInView:(UIView *)baseView
{
    [_indicator startAnimating];
    [baseView addSubview:self];
}

@end
