//
//  AppMacro.h
//  封装控件
//
//  Created by TangTieshan on 14-8-4.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

//跟app相关的宏

#import "CAPrintCenter.h"

#ifndef _____AppMacro_h
#define _____AppMacro_h

//打印
#define EFUN_LOG(format, ...) do {                                                                                  \
                                    if ([CAPrintCenter defaultCentre].isPrint){                                     \
                                        fprintf(stderr, "<%s : %d> %s\n",                                           \
                                        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                        __LINE__, __func__);                                                        \
                                        (NSLog)((format), ##__VA_ARGS__);                                           \
                                        fprintf(stderr, "-------\n");                                               \
                                    }                                                                               \
                                } while (0)

#endif
