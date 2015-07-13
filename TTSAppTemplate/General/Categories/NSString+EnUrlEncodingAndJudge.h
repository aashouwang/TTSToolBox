//
//  NSString+UrlEncodingAndJudge.h
//  EFUNPFApp
//
//  Created by TangTieshan on 14-9-5.
//  Copyright (c) 2014年 TangTieshan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EnUrlEncodingAndJudge)
/**
 *	@brief	将NSString字符串进行URL转码，并将转码后的NSString返回
 *
 *	@return	转码后的NSString
 */
- (NSString *)urlEncodeString;

/**
 *	@brief	判断字符串中是否有中文
 *
 *	@param 	string 	传入的字符串
 *
 *	@return	存在中文返回yes， 否则返回no
 */
+ (BOOL)whetherStringContainChineseWord:(NSString *)string;

/**
 *	@brief	判断字符串中是否全部由空格组成
 *
 *	@param 	str 	被判断的字符串
 *
 *	@return	如果全部是空格，则返回yes， 否则返回no
 */
+ (BOOL)whetherStringAllContainSpaceWord:(NSString * )str;

/**
 *	@brief	判断传入的邮箱是否正确
 *
 *	@param 	email     邮箱字符串
 *
 *	@return	如果正确返回yes，否则返回no
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *	@brief	计算字符串的长度，包含中文
 *
 *	@param 	strtemp 	字符串
 *
 *	@return	字符串长度
 */
+ (int)convertToInt:(NSString*)strtemp;

/**
 *	@brief	判斷第一個字符是不是英文字母  如果是的話返回YES，否則返回NO
 *
 *	@param 	str 	被判斷的字符串
 *
 *	@return	如果是的話返回YES，否則返回NO
 */
+ (BOOL)whetherFirstIsWord:(NSString *)str;

+ (NSString *)hexStringFromData:(NSData *)data;
@end
