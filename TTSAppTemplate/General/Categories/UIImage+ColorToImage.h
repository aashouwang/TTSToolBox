//
//  UIImage+ColorToImage.h
//  EFUNPFApp
//
//  Created by TangTieshan on 14-9-3.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorToImage)
/**
 *	@brief	直接通过颜色生成一个纯色的图片
 *
 *	@param 	color 	UIColor * 對象
 *	@param 	size 	生成的圖片的尺寸
 *
 *	@return	生成圖片UIImage * 對象
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
