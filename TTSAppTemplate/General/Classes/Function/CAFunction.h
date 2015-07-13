//
//  EFUNPlatFormFucntion.h
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 定义屏幕类型
 */
typedef NS_ENUM(NSInteger, EFUN_SCREEN_TYPE)
{
    EFUN_SCREEN_3_5 = 0,            //iphone4
    EFUN_SCREEN_4_0,                //iphone5
    EFUN_SCREEN_IPAD,                   //ipad
    EFUN_SCREEN_UNKNOW
};

@interface CAFunction : NSObject



#pragma mark - 获取参数
//// 1 获取efun唯一标示
//+(NSString *)getEfunUUID;

// 2 獲取時間戳
+(NSString *)getTimeStamp;

// 3 获取当前操作系统版本
+(NSString *)getSystemVersion;

// 4 获取当前设备类型
+(NSString *)getPlatForm;

// 5 获取mac地址
+(NSString *)getMacaddress;

// 6 获取idfa
+(NSString *)getIdfa;

//// 7 获取IP地址
//+(NSString *)getIPAddress;

// 8 获取当前屏幕类型
+(EFUN_SCREEN_TYPE)getCurrentScreenType;

//// 9 获取当前设备尺寸
//+(CGRect)getCurrentScreenFrame;

// 10 判断当前网络状态,是否联网
+(BOOL)connectedToNetWork;

// 11 获取日期
+(NSString *)getTimeDate;

// 12 获取配置文件信息
+(NSDictionary *)getProjectInfoPlist;



#pragma mark - 常用基本方法

//md5加密
+(NSString *)getMD5StrFromString:(NSString *)beforeMD5String;

//解析URL
+(NSDictionary*)parseURLParams:(NSString *)query;

//进行64位转吗
+(NSString *)encode:(const uint8_t *)input length:(NSInteger)length;
@end
