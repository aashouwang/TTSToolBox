//
//  UIView+RectPosition.m
//  封装控件
//
//  Created by TangTieshan on 14-8-1.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "UIView+RectPosition.h"

@implementation UIView (RectPosition)
- (CGPoint)topLeftPos
{
    return CGPointMake(self.frame.origin.x, self.frame.origin.y);
}

- (CGPoint)topRightPos
{
    return CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y);
}

- (CGPoint)bottomLeftPos
{
    return CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height);
}

- (CGPoint)bottomRightPos
{
    return CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
}

- (CGFloat)viewWidth
{
    return self.frame.size.width;
}

- (CGFloat)viewHeight
{
    return self.frame.size.height;
}

- (CGFloat)viewOriX
{
    return self.frame.origin.x;
}

- (CGFloat)viewOriY
{
    return self.frame.origin.y;
}

- (CGSize)viewSize
{
    return self.frame.size;
}

@end
