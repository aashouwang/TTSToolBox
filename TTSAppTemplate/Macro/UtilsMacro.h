//
//  UtilsMacro.h
//  封装控件
//
//  Created by TangTieshan on 14-8-1.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

//一些常用的方便使用的宏

#ifndef _____UtilsMacro_h
#define _____UtilsMacro_h

//颜色
#define COLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RED_COLOR               [UIColor redColor]          //红色
#define BLUE_COLOR              [UIColor blueColor]         //蓝色
#define CYAN_COLOR              [UIColor cyanColor]         //青色
#define GRAY_COLOR              [UIColor grayColor]         //灰色
#define CLEAR_COLOR             [UIColor clearColor]        //无色
#define BROWN_COLOR             [UIColor brownColor]        //棕色
#define GREEN_COLOR             [UIColor greenColor]        //绿色
#define WHITE_COLOR             [UIColor whiteColor]        //白色
#define BLACK_COLOR             [UIColor blackColor]        //黑色
#define PURPLE_COLOR            [UIColor purpleColor]       //紫色
#define YELLOW_COLOR            [UIColor yellowColor]       //黄色
#define ORANGE_COLOR            [UIColor orangeColor]       //橘色
#define MAGENTA_COLOR           [UIColor magentaColor]      //洋红色
#define DARKGRAY_COLOR          [UIColor darkGrayColor]     //深灰色
#define LIGHTGRAY_COLOR         [UIColor lightGrayColor]    //浅灰色

//系统
#define IS_IOS7_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
#define IS_IOS8_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f)

//图片
#define IMG(imageName) [UIImage imageNamed:(imageName)]

//屏幕
#define SCREEN_SIZE    [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH   SCREEN_SIZE.width
#define SCREEN_HEIGHT  SCREEN_SIZE.height

//设备
#define IS_IPAD     ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//数据存储
#define USEDEFAULTS             [NSUserDefaults standardUserDefaults]
#endif
