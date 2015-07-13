//
//  EFUNPlatFormAlertView.h
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

/*
    封装UIalertview，使用的时候可以直接通过[类名 方法名]来调用
 */
#import <Foundation/Foundation.h>
#import "CAAlertViewDelegate.h"

@interface CAAlertView : NSObject
+ (UIAlertView *)showAlertWithMessage:(NSString *)message andViewController:(UIViewController *)viewController;

+ (UIAlertView *)showAlertWithMessage:(NSString *)message
                          completion:(EfunAlertViewHandler)handler
                   andViewController:(UIViewController *)viewController
                     andButtonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end
