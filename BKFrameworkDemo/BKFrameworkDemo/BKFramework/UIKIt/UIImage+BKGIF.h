//
//  UIImage+BKGIF.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BKGIF)

+ (UIImage *)animatedGIFNamed:(NSString *)name;

+ (UIImage *)animatedGIFWithData:(NSData *)data;

@end
