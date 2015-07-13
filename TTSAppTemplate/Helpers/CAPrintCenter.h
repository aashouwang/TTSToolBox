//
//  EFUNPlatFormCentre.h
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

/*
 －EFUN中心，是一个单例,游戏一旦运行，就开始存在
 
 －初始化和保存一些基本配置数据
 */

#import <Foundation/Foundation.h>

/* 打印日志 */
#define PF_PRINT_FILE_NAME @"efun_print_file.txt"                                        //打印log日志的文件名字，这个文件要放在cache文件夹中。
#define PF_PRINT_FILE_CONTENT @"syCUVLZIwZAM9corFIW2ryTzEu2YNuZzhdis84wGcWI0Pou13eeLKjDkr7Zubcap5nNLWWY1xKX4ZqBJwKuCMrBRc4uPVIHct7EFxlcCgRpipSYE3BR5PvO8FJXwWrUv"


@interface CAPrintCenter : NSObject
/*
 ISPRINT 布尔值
 程序运行时候，是否在log中打印全部的追踪内容，主要用于调试。
 默认NO：不打印；如果是YES：打印
 每次调用该单例的时候，单例初始化过程中，会从本地路径读取特定文件的特定内容，有对应文件*/
@property (nonatomic) BOOL isPrint;

//获取单例
+ (CAPrintCenter *)defaultCentre;
@end
