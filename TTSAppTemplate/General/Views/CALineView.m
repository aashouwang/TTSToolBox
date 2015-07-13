//
//  TTSLineView.m
//  画虚线
//
//  Created by tieshan on 15/3/12.
//  Copyright (c) 2015年 铁山. All rights reserved.
//

/*
    画虚线
 */

#import "CALineView.h"

@implementation CALineView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _lineType = TTSDotLine;
        _lineColor = [UIColor redColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    CGContextSetLineWidth(context,0.5);//线宽度
    
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    
    if (_lineType == TTSDotLine) {
        
        CGFloat lengths[] = {4,2};//先画4个点再画2个点
        
        CGContextSetLineDash(context,0, lengths,2);//注意2(count)的值等于lengths数组的长度
    }
    else
    {
        CGFloat lengths[] = {4,0};//先画4个点再画2个点
        
        CGContextSetLineDash(context,0, lengths,2);//注意2(count)的值等于lengths数组的长度
    }
    
    
    CGContextMoveToPoint(context,0,0);
    
    CGContextAddLineToPoint(context, rect.size.width, 0);
    
    CGContextStrokePath(context);
    
//    CGContextClosePath(context);
}

- (void)setLineColor:(UIColor *)lineColor
{
    if (_lineColor != lineColor) {
        [_lineColor release];
        _lineColor = [lineColor retain];
    }
    [self setNeedsDisplay];
}

- (void)setLineType:(TTSLineType)lineType
{
    _lineType = lineType;
    [self setNeedsDisplay];
}


@end
