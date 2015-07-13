//
//  CALoadingView.h
//  CAComApp
//
//  Created by tieshan on 15/4/11.
//  Copyright (c) 2015年 铁山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CALoadingView : UIView
{
    NSString * _promptStr;
    UIActivityIndicatorView * _indicator;
}
- (id)initWithFrame:(CGRect)frame andLoadingPromptString:(NSString *)promptStr;
- (void)showLoadingViewInView:(UIView *)baseView;
@end
