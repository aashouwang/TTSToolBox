//
//  UIView+RectPosition.h
//  封装控件
//
//  Created by TangTieshan on 14-8-1.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RectPosition)
/**
 *	@brief	获取UIView左上角的坐标，也就是本身的坐标
 *
 *	@return	坐标点
 */
- (CGPoint)topLeftPos;

/**
 *	@brief	获取UIView右上角的坐标
 *
 *	@return	坐标点
 */
- (CGPoint)topRightPos;

/**
 *	@brief	获取UIView左下角的坐标
 *
 *	@return	坐标点
 */
- (CGPoint)bottomLeftPos;

/**
 *	@brief	获取UIView右下角的坐标
 *
 *	@return	坐标点
 */
- (CGPoint)bottomRightPos;

/**
 *	@brief	获取UIView的宽度
 *
 *	@return	宽度
 */
- (CGFloat)viewWidth;

/**
 *	@brief	获取UIView的高度
 *
 *	@return	高度
 */
- (CGFloat)viewHeight;

/**
 *	@brief	获取UIView的x轴坐标
 *
 *	@return	x轴坐标
 */
- (CGFloat)viewOriX;

/**
 *	@brief	获取UIView的y轴坐标
 *
 *	@return	y轴坐标
 */
- (CGFloat)viewOriY;

/**
 *	@brief	获取UIView的尺寸
 *
 *	@return	尺寸
 */
- (CGSize)viewSize;


@end
