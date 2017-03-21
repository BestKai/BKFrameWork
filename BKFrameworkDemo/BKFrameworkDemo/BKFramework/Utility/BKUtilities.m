//
//  BKUtilities.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/21.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKUtilities.h"

CGFloat BKScreenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

CGSize BKScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}
