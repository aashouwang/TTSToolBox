//
//  NSString+UrlEncodingAndJudge.m
//  EFUNPFApp
//
//  Created by TangTieshan on 14-9-5.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import "NSString+EnUrlEncodingAndJudge.h"

@implementation NSString (EnUrlEncodingAndJudge)
- (NSString *)urlEncodeString
{
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           (CFStringRef)@";/?:@&=$+{}<>,",
                                                                           kCFStringEncodingUTF8);
    return [result autorelease];
}

+ (BOOL)whetherStringContainChineseWord:(NSString *)string
{
    BOOL ret = NO;
    for (int i = 0; i < [string length]; i++) {
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            ret = YES;
            break;
        }
    }
    return ret;
}


+ (BOOL)whetherStringAllContainSpaceWord:(NSString * )str
{
    BOOL ret = YES;
    for (int i = 0; i< str.length; i++) {
        NSString * string = [str substringWithRange:NSMakeRange(i, 1)];
        if (![string isEqualToString:@" "]) {
            ret = NO;
            break;
        }
    }
    return ret;
}


+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (int)convertToInt:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}

+ (BOOL)whetherFirstIsWord:(NSString *)str
{
    BOOL ret = NO;
    unichar firstNum = [str characterAtIndex:0];
    if ((firstNum >= 'a' && firstNum <= 'z') || (firstNum >= 'A' && firstNum <= 'Z')) {
        ret = YES;
    }
    return ret;
}

+ (NSString *)stringFromByte:(Byte)byteVal
{
    NSMutableString *str = [NSMutableString string];
    
    //取高四位
    Byte byte1 = byteVal>>4;
    //取低四位
    Byte byte2 = byteVal & 0xf;
    //拼接16进制字符串
    [str appendFormat:@"%x",byte1];
    [str appendFormat:@"%x",byte2];
    return str;
}

+ (NSString *)hexStringFromData:(NSData *)data
{
    NSMutableString *str = [NSMutableString string];
    Byte *byte = (Byte *)[data bytes];
    for (int i = 0; i<[data length]; i++) {
        // byte+i为指针
        [str appendString:[self stringFromByte:*(byte+i)]];
    }
    return str;
}
@end
