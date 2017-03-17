//
//  NSUserDefaults+BKSafeAccess.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/17.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (BKSafeAccess)

+ (NSString *)bk_stringForKey:(NSString *)defaultName;

+ (NSArray *)bk_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)bk_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)bk_dataForKey:(NSString *)defaultName;

+ (NSArray *)bk_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)bk_integerForKey:(NSString *)defaultName;

+ (float)bk_floatForKey:(NSString *)defaultName;

+ (double)bk_doubleForKey:(NSString *)defaultName;

+ (BOOL)bk_boolForKey:(NSString *)defaultName;

+ (NSURL *)bk_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)bk_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)bk_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)bk_setArcObject:(id)value forKey:(NSString *)defaultName;

@end
