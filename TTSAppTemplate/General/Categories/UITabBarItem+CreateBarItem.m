//
//  UITabBarItem+CreateBarItem.m
//  封装控件
//
//  Created by TangTieshan on 14-8-1.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "UITabBarItem+CreateBarItem.h"

@implementation UITabBarItem (CreateBarItem)
+ (UITabBarItem *)createBarItemWithTitle:(NSString *)title andNormalImageName:(NSString *)normalName andSelectedImageName:(NSString *)selectedName andTag:(NSUInteger)tag
{
    UITabBarItem * tabBarItem;
    UIImage * normalImage = nil;
    UIImage * selectedImage = nil;
    if (normalName && ![normalName isEqualToString:@""]) {
        normalImage = [UIImage imageNamed:normalName];
    }
    if (selectedName && ![selectedName isEqualToString:@""]) {
        selectedImage = [UIImage imageNamed:selectedName];
    }
    
    if (IS_IOS7_ABOVE) {
        if (normalImage && selectedImage) {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
//            [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        }
        else if (normalImage && !selectedImage)
        {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:normalImage];
//            [tabBarItem setFinishedSelectedImage:normalImage withFinishedUnselectedImage:normalImage];
        }
        else if (!normalImage && selectedImage)
        {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:selectedImage selectedImage:selectedImage];
//            [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:selectedImage];
        }
        else
        {
            tabBarItem = [[UITabBarItem alloc] init];
        }
    }
    else
    {
        if (normalImage && selectedImage) {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage tag:tag];
            [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        }
        else if (normalImage && !selectedImage)
        {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage tag:tag];
            [tabBarItem setFinishedSelectedImage:normalImage withFinishedUnselectedImage:normalImage];
        }
        else if (!normalImage && selectedImage)
        {
            tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage tag:tag];
            [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:selectedImage];
        }
        else
        {
            tabBarItem = [[UITabBarItem alloc] init];
        }
    }
    return [tabBarItem autorelease];
}
@end
