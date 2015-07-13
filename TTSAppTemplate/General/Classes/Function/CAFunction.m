//
//  EFUNPlatFormFucntion.m
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAFunction.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "netdb.h"
#import <CommonCrypto/CommonCrypto.h>
#import <AdSupport/AdSupport.h>
//#import "EFUNTwPlatFormIPAddress.h"
//#import "CACFUUID.h"

#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>

@implementation CAFunction
//#pragma mark - 获取efunCFUUID
//+(NSString *)getEfunUUID
//{
//    NSString * efunUUid=[CACFUUID efunUID];
//    NSString * systemlog=[NSString stringWithFormat:@"get efun uuid:%@",efunUUid];
//    EFUN_LOG(@"%@", systemlog);
//    return efunUUid;
//}

#pragma mark - 进行md5加密
+(NSString *)getMD5StrFromString:(NSString *)beforeMD5String
{
    EFUN_LOG(@"md5");
    const char * cString = [beforeMD5String UTF8String];
    unsigned char result[16];
    CC_MD5(cString, strlen(cString), result);
    NSString *sign= [NSString stringWithFormat:
                     @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                     result[0], result[1], result[2], result[3],
                     result[4], result[5], result[6], result[7],
                     result[8], result[9], result[10], result[11],
                     result[12], result[13], result[14], result[15]
                     ];
    return [sign uppercaseString];
}

#pragma mark - 获取当前iOS操作系统版本号
+(NSString *)getSystemVersion
{
    NSString * systemversion=[[UIDevice currentDevice] systemVersion];
    //判断全打印
    NSString * systemlog=[NSString stringWithFormat:@"get system version:%@",systemversion];
    EFUN_LOG(@"%@", systemlog);
    return systemversion;
}

#pragma mark - 获取当前设备类型
+(NSString *)getDeviceVersion
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+(NSString *)getPlatForm
{
    NSString *platform = [self getDeviceVersion];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])
    {
        platform = @"iPhone";
    }
    else if ([platform isEqualToString:@"iPhone1,2"])
    {
        platform = @"iPhone_3G";
    }
    else if ([platform isEqualToString:@"iPhone2,1"])
    {
        platform = @"iPhone_3GS";
    }
    else if ([platform isEqualToString:@"iPhone3,1"])
    {
        platform = @"iPhone_4";
    }
    else if ([platform isEqualToString:@"iPhone4,1"])
    {
        platform = @"iPhone_4S";
    }
    else if ([platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"])
    {
        platform = @"iPhone_5";
    }
    else if ([platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"])
    {
        platform = @"iPhone_5C";
    }
    else if ([platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"])
    {
        platform = @"iPhone_5S";
    }
    else if ([platform isEqualToString:@"iPhone7,2"])
    {
        platform = @"iPhone_6";
    }
    else if ([platform isEqualToString:@"iPhone7,1"])
    {
        platform = @"iPhone_6_Plus";
    }
    //ipod
    else if ([platform isEqualToString:@"iPod1,1"])
    {
        platform = @"iPod_Touch";
    }
    else if ([platform isEqualToString:@"iPod2,1"])
    {
        platform = @"iPod_Touch_2";
    }
    else if ([platform isEqualToString:@"iPod3,1"])
    {
        platform = @"iPod_Touch_3";
    }
    else if ([platform isEqualToString:@"iPod4,1"])
    {
        platform = @"iPod_Touch_4";
    }
    else if ([platform isEqualToString:@"iPod5,1"])
    {
        platform = @"iPod_Touch_5";
    }
    //iPad
    else if ([platform isEqualToString:@"iPad1,1"])
    {
        platform = @"iPad";
    }
    else if ([platform isEqualToString:@"iPad2,1"] || [platform isEqualToString:@"iPad2,2"] || [platform isEqualToString:@"iPad2,3"])
    {
        platform = @"iPad_2";
    }
    else if ([platform isEqualToString:@"iPad2,4"])
    {
        platform = @"iPad_2";
    }
    else if ([platform isEqualToString:@"iPad2,5"] || [platform isEqualToString:@"iPad2,6"] || [platform isEqualToString:@"iPad2,7"])
    {
        platform = @"iPad_Mini_1";
    }
    else if ([platform isEqualToString:@"iPad3,1"] || [platform isEqualToString:@"iPad3,2"] || [platform isEqualToString:@"iPad3,3"])
    {
        platform = @"iPad_3";
    }
    else if ([platform isEqualToString:@"iPad3,4"] || [platform isEqualToString:@"iPad3,5"] || [platform isEqualToString:@"iPad3,6"])
    {
        platform = @"iPad_4";
    }
    else if ([platform isEqualToString:@"iPad4,1"] || [platform isEqualToString:@"iPad4,2"] || [platform isEqualToString:@"iPad4,3"])
    {
        platform = @"iPad_air";
    }
    else if ([platform isEqualToString:@"iPad4,4"] || [platform isEqualToString:@"iPad4,5"] || [platform isEqualToString:@"iPad4,6"])
    {
        platform = @"iPad_mini_2";
    }
    else if ([platform isEqualToString:@"iPad4,7"] || [platform isEqualToString:@"iPad4,8"] || [platform isEqualToString:@"iPad4,9"])
    {
        platform = @"iPad_mini_3";
    }
    else if ([platform isEqualToString:@"iPad5,3"] || [platform isEqualToString:@"iPad5,4"])
    {
        platform = @"iPad_air_2";
    }
    else if ([platform isEqualToString:@"iPhone Simulator"] || [platform isEqualToString:@"x86_64"])
    {
        platform = @"iPhone_Simulator";
    }
    //判断全打印
    NSString * systemlog=[NSString stringWithFormat:@"get platform:%@",platform];
    EFUN_LOG(@"%@", systemlog);
    return platform;
}

#pragma mark - 获取MAC地址
+(NSString *)getMacaddress
{
	int                    mib[6];
	size_t                len;
	char                *buf;
	unsigned char        *ptr;
	struct if_msghdr    *ifm;
	struct sockaddr_dl    *sdl;
	mib[0] = CTL_NET;
	mib[1] = AF_ROUTE;
	mib[2] = 0;
	mib[3] = AF_LINK;
	mib[4] = NET_RT_IFLIST;
	if ((mib[5] = if_nametoindex("en0")) == 0) {
		printf("Error: if_nametoindex error/n");
		return NULL;
	}
	if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
		printf("Error: sysctl, take 1/n");
		return NULL;
	}
	if ((buf = malloc(len)) == NULL) {
		printf("Could not allocate memory. error!/n");
		return NULL;
	}
	if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
		printf("Error: sysctl, take 2");
		return NULL;
	}
	ifm = (struct if_msghdr *)buf;
	sdl = (struct sockaddr_dl *)(ifm + 1);
	ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	//NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	free(buf);
    //判断全打印
    NSString * systemlog=[NSString stringWithFormat:@"get mac:%@",[outstring uppercaseString]];
    EFUN_LOG(@"%@", systemlog);
	return [outstring uppercaseString];
}

#pragma mark - 获取IDFA
+(NSString *)getIdfa
{
    NSString *idfaStr = nil;
    if ([[self getSystemVersion] intValue] >= 6)
    {
        idfaStr = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    else
    {
        idfaStr = @"";
    }
    //判断全打印
    NSString * systemlog =[NSString stringWithFormat:@"get idfa:%@",idfaStr];
    EFUN_LOG(@"%@", systemlog);
    return idfaStr;
}

#pragma mark - 获取当前屏幕尺寸
//+(CGRect)getCurrentScreenFrame
//{
//    CGRect currentScreenSize;
//    if (EFUN_GAME_IS_GAME_INTERFACE_THWARTWISE)//如果是横屏幕的游戏
//    {
//        switch ([self getCurrentScreenType])
//        {
//            case EFUN_SCREEN_3_5:
//                currentScreenSize=CGRectMake(0, 0, 480, 320);
//                break;
//            case EFUN_SCREEN_4_0:
//                currentScreenSize=CGRectMake(0, 0, 568, 320);
//                break;
//            case EFUN_SCREEN_IPAD:
//                currentScreenSize=CGRectMake(0, 0, 1024, 768);
//                break;
//            default:
//                break;
//        }
//    }
//    else
//    {
//        switch ([self getCurrentScreenType])
//        {
//            case EFUN_SCREEN_3_5:
//                currentScreenSize=CGRectMake(0, 0, 320, 480);
//                break;
//            case EFUN_SCREEN_4_0:
//                currentScreenSize=CGRectMake(0, 0, 320, 568);
//                break;
//            case EFUN_SCREEN_IPAD:
//                currentScreenSize=CGRectMake(0, 0, 768, 1024);
//                break;
//            default:
//                break;
//        }
//    }
//    //判断全打印
//    NSString * systemlog=[NSString stringWithFormat:@"get screen frame w%f_h%f",currentScreenSize.size.width,currentScreenSize.size.height];
//    EFUN_LOG(systemlog)
//    return currentScreenSize;
//}

#pragma mark - 获取当前屏幕类型
+(EFUN_SCREEN_TYPE)getCurrentScreenType
{
    EFUN_LOG(@"get screen type");
    //通过获取当前屏幕的较长边的长度，捕捉当前屏幕信息,获取正当的途径。
    float ScreenHeight=[UIScreen mainScreen].bounds.size.height;
    float ScreenWidth=[UIScreen mainScreen].bounds.size.width;
    float RealHeight=ScreenHeight>ScreenWidth?ScreenHeight:ScreenWidth;
    if (480==RealHeight)
    {
        return EFUN_SCREEN_3_5;
    }
    else if (568==RealHeight)
    {
        return EFUN_SCREEN_4_0;
    }
    else if (1024==RealHeight)
    {
        return EFUN_SCREEN_IPAD;
    }
    return EFUN_SCREEN_UNKNOW;
}

//#pragma mark - 获取IP地址
//+(NSString *)getIPAddress
//{
//    efunPlatFormInitAddresses () ;
//    efunPlatFormGetIPAddresses () ;
//    efunPlatFormGetHWAddresses () ;
//    NSString * ip=[ NSString stringWithFormat:@"%s", ip_names[1]];
//    //判断全打印
//    NSString * systemlog=[NSString stringWithFormat:@"get ip adress:%@",ip];
//    EFUN_LOG(@"%@", systemlog);
//    return ip;
//}

#pragma mark - 判断当前网络状态,是否联网
+(BOOL)connectedToNetWork
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags)
    {
        printf("Error.Count not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

#pragma mark - 获取日期
+(NSString *)getTimeDate
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd_HH:mm"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

#pragma mark - 获取项目配置信息
+(NSDictionary *)getProjectInfoPlist
{
    return [[NSBundle mainBundle]infoDictionary];
}

#pragma mark - - － － － － － － － －

#pragma mark - 获取时间戳
+(NSString *)getTimeStamp
{
    double timeS=[[[[NSDate alloc]init] autorelease]timeIntervalSince1970];
    double timeMS=timeS*1000;
    NSString * timestr=[NSString stringWithFormat:@"%f",timeMS];
    NSRange range=[timestr rangeOfString:@"."];
    NSString * timeMSStr=[timestr substringToIndex:range.location];
    //判断全打印
    NSString * systemlog=[NSString stringWithFormat:@"get time:%@",timeMSStr];
    EFUN_LOG(@"%@", systemlog);
    return timeMSStr;
}

#pragma mark - 解析URL
+(NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}

#pragma mark - 进行base64位转吗
+(NSString *)encode:(const uint8_t *)input length:(NSInteger)length
{
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    NSMutableData *data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t *output = (uint8_t *)data.mutableBytes;
    for (NSInteger i = 0; i < length; i += 3)
    {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); j++)
        {
            value <<= 8;
            if (j < length)
            {
                value |= (0xFF & input[j]);
            }
        }
        NSInteger index = (i / 3) * 4;
        output[index + 0] =                    table[(value >> 18) & 0x3F];
        output[index + 1] =                    table[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    return [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease];
}
@end
;