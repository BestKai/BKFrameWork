//
//  NSString+BKSystem.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/15.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BKSystem)

/**
 *  获取app  Version
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationVersion;
/**
 *  获取app  名称
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationName;

/**
 *  application  documents路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)documentsPath;

/**
 *  application  cache 路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)cachesPath;


/**
 *  application library 路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)libraryPath;


@end
