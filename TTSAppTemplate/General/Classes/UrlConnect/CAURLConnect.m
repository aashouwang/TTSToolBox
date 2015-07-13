//
//  EFUNPlatFormURLConnect.m
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "CAURLConnect.h"
//#import "EFUNPlatFormDefine.h"

@implementation CAURLConnect
@synthesize handler;

-(void)dealloc
{
    if (_connectData)
    {
        EFUN_LOG(@"connect data release");
        [_connectData autorelease];
    }
    EFUN_LOG(@"connect release");
    [super dealloc];
}

#pragma mark - 对外接口,通过一个NSURLRequest访问服务器，并通过一个block把结果返回给请求方法 -
+(NSURLConnection *)accessServerWithRequest:(NSURLRequest *)request andHandler:(EFUNAccessServerHandler)aHandler
{
    EFUN_LOG(@"start connect");
    //创建一个对象，等待服务器返回返回值。
    CAURLConnect * connectObject=[[CAURLConnect alloc]init];
    connectObject.handler = aHandler;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    return [NSURLConnection connectionWithRequest:request delegate:connectObject];
}

#pragma mark -
#pragma mark 监听NSURLConnect访问结果
#pragma mark -
//接收到请求头
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    EFUN_LOG(@"did receive response");
    _connectData=[[NSMutableData alloc]initWithCapacity:10];
}
//接收到数据中
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_connectData appendData:data];
}
//接收数据完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    EFUN_LOG(@"connect did finish loading");
    if (self.handler)
    {
        self.handler(_connectData,nil);
        [self.handler release];
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self release];
}
//接收数据失败
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    EFUN_LOG(@"did fail with error");
    if (self.handler)
    {
        self.handler(nil,error);
        [self.handler release]; 
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self release];
}
@end
