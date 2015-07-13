//
//  TTSLineView.h
//  画虚线
//
//  Created by tieshan on 15/3/12.
//  Copyright (c) 2015年 铁山. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TTSLineType) {
    TTSDotLine = 1,         //虚线
    TTSRealLine,        //实线
};

@interface CALineView : UIView
@property (nonatomic, retain)UIColor * lineColor;
@property (nonatomic, assign)TTSLineType lineType;
@end
