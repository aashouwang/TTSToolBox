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
        [self initConstantData];
        _linePosition = TTSLinePositionTop;
    }
    return self;
}

- (CALineView *)initWithFrame:(CGRect)frame andLinePosi:(TTSLinePosition)linePosition
{
    if (self = [super initWithFrame:frame]) {
        [self initConstantData];
        _linePosition = linePosition;
    }
    return self;
}

- (void)initConstantData
{
    self.opaque = NO;
    _lineType = TTSDotLine;
    _lineColor = [UIColor redColor];
    _lineWidth = 0.5f;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    CGContextSetLineWidth(context,_lineWidth);//线宽度
    
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    
    if (_lineType == TTSDotLine) {
        
        CGFloat lengths[] = {4, 2};//先画4个点再画2个点
        
        CGContextSetLineDash(context, 0, lengths, 2);//注意2(count)的值等于lengths数组的长度
    }
    else
    {
        CGFloat lengths[] = {4, 0};//先画4个点再画2个点
        
        CGContextSetLineDash(context, 0, lengths, 2);//注意2(count)的值等于lengths数组的长度
    }
    
    //设置横线的位置
    if (_linePosition == TTSLinePositionTop) {
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, rect.size.width, 0);
    }
    else if (_linePosition == TTSLinePositionLeft)
    {
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, rect.size.height);
    }
    else if (_linePosition == TTSLinePositionBottom)
    {
        CGContextMoveToPoint(context, 0, rect.size.height - _lineWidth);
        CGContextAddLineToPoint(context, rect.size.width, rect.size.height - _lineWidth);
    }
    else if (_linePosition == TTSLinePositionRight)
    {
        CGContextMoveToPoint(context, rect.size.width - _lineWidth, 0);
        CGContextAddLineToPoint(context, rect.size.width - _lineWidth, rect.size.height);
    }
    
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

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}
@end
