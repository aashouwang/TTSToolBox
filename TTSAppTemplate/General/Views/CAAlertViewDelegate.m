//
//  EFUNPlatFormAlertViewDelegate.m
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "CAAlertViewDelegate.h"

@implementation CAAlertViewDelegate
@synthesize handler;

-(void)dealloc
{
    [super dealloc];
}

//创建一个代理对象，设置回调方法
+(CAAlertViewDelegate *)creatDelegateWithBack:(EfunAlertViewHandler)oneHandler
{
    CAAlertViewDelegate * alertViewDelegate=[[CAAlertViewDelegate alloc]init];
    alertViewDelegate.handler=oneHandler;
    return alertViewDelegate;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (handler)
    {
        handler(buttonIndex);
        [handler release];
    }
    [self release];
}
@end
