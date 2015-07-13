//
//  UITabBarItem+CreateBarItem.h
//  封装控件
//
//  Created by TangTieshan on 14-8-1.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (CreateBarItem)
+ (UITabBarItem *)createBarItemWithTitle:(NSString *)title andNormalImageName:(NSString *)normalName andSelectedImageName:(NSString *)selectedName andTag:(NSUInteger)tag;
@end
