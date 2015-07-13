//
//  EFUNPlatFormAlertView.m
//  EfunPlatForm
//
//  Created by TangTieshan on 14-2-19.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "CAAlertView.h"

@implementation CAAlertView

+(UIAlertView *)showAlertWithMessage:(NSString *)message andViewController:(UIViewController *)viewController
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) {
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil
                                                                          message:message
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * oneAction = [UIAlertAction actionWithTitle:@"确定"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {}];
        [alertVC addAction:oneAction];
        [viewController presentViewController:alertVC animated:YES completion:^{}];
        return nil;
    }
    
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:nil
                                                  message:message
                                                 delegate:nil
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    return alert;
}

+(UIAlertView *)showAlertWithMessage:(NSString *)message
                          completion:(EfunAlertViewHandler)handler
                   andViewController:(UIViewController *)viewController
                     andButtonTitles:(NSString *)buttonTitles,...
{
    va_list args;
    va_start(args, buttonTitles);
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) {
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil
                                                                          message:message
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        int i = 0;
        for (NSString *str = buttonTitles; str != nil; str = va_arg(args,NSString*)) {
            UIAlertAction * oneAction = [UIAlertAction actionWithTitle:str
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction *action) {
                                                                   handler(i);
                                                               }];
            [alertVC addAction:oneAction];
            i++;
        }
        [viewController presentViewController:alertVC animated:YES completion:^{}];
        va_end(args);
        return nil;
    }
    
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:nil
                                                  message:message
                                                 delegate:[CAAlertViewDelegate creatDelegateWithBack:handler]
                                        cancelButtonTitle:nil otherButtonTitles:nil];
    for (NSString *str = buttonTitles; str != nil; str = va_arg(args,NSString*)) {
        [alert addButtonWithTitle:str];
    }
    [alert show];
    [alert release];
    va_end(args);
    return alert;
}
@end
