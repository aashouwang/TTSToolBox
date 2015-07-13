//
//  EFUNPlatFormCentre.m
//  ;
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "CAPrintCenter.h"

@implementation CAPrintCenter
@synthesize isPrint = _isPrint;


static CAPrintCenter * centre = nil;                         //单例对象
+ (CAPrintCenter *)defaultCentre
{
    if (centre == nil) {
        centre = [[CAPrintCenter alloc] init];
        centre.isPrint = NO;
        
        //获取读取是否需要显示打印文件的回族是
        NSString * filePath = [self getWhetherPrintInfoFilePath];
        
        //读取文件的内容，如果读取到的内容等于指定的内容，就设置属性值，可以打印日志信息
             // 1.根据读取到的路径，读取文件，然后判断是否打印日志
        NSError * error = nil;
        NSString * fileContent = [NSString stringWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:&error];
             // 2.判断读取的内容是否跟我们之前定得字符串相等
        if (!error) {
            if ([fileContent isEqualToString:PF_PRINT_FILE_CONTENT]) {
                
                centre.isPrint = YES;                           //可以打印
                
            }
            else
            {
                NSLog(@"%@", error.description);
            }
        }
        
    }
    return centre;
}

/**
 *	@brief	获取判断是否需要打印的文件的路径
 *
 *	@return	获取到文件的路径
 */
+ (NSString *)getWhetherPrintInfoFilePath
{
    NSString * bundleStr = [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    
    NSString * filePath = [bundleStr stringByAppendingFormat:
                           @"/Caches/%@", PF_PRINT_FILE_NAME];
    
    NSLog(@"是否打印的路径是：%@",filePath);
    
    return filePath;
}
@end
