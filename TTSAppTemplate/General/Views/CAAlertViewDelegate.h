//
//  EFUNPlatFormAlertViewDelegate.h
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

/*
    封装的UIAlertView类对应的协议
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^EfunAlertViewHandler)(NSInteger clickedBtnIndex);

@interface CAAlertViewDelegate : NSObject
<UIAlertViewDelegate>

@property (nonatomic,copy) EfunAlertViewHandler handler;

+ (CAAlertViewDelegate *)creatDelegateWithBack:(EfunAlertViewHandler)oneHandler;

@end
