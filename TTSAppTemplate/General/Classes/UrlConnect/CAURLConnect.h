//
//  EFUNPlatFormURLConnect.h
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//
/*
 
 －访问URL连接的类
 
 －可以支持post和get形势的 NSURLRequest，服务器返回结果，通过black回调。
 
 －回调black有两个参数：
 resultData:服务器的返回数据
 error:访问服务器是否失败
 
 */

#import <Foundation/Foundation.h>
//#import "EFUNPlatFormDefine.h"

//定义一个回调函数block
typedef void (^EFUNAccessServerHandler)(NSData * resultData,NSError *error);

@interface CAURLConnect : NSObject<
  NSURLConnectionDataDelegate,
  NSURLConnectionDelegate>
{
    NSMutableData * _connectData;//接收服务器数据的MutableData
}

/*一个block用来把访问服务器的结果返回给请求的函数*/
@property (nonatomic,copy)EFUNAccessServerHandler handler;

//用创建的一个NSURLRequest访问网络，获取结果
+(NSURLConnection *)accessServerWithRequest:(NSURLRequest *)request andHandler:(EFUNAccessServerHandler)aHandler;

@end
