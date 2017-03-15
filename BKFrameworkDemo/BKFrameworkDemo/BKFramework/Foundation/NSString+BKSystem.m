//
//  NSString+BKSystem.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/15.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "NSString+BKSystem.h"

@implementation NSString (BKSystem)

+ (NSString *)getMyApplicationVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    return version;
}


+ (NSString *)getMyApplicationName {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}


+ (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)cachesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)libraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

@end
