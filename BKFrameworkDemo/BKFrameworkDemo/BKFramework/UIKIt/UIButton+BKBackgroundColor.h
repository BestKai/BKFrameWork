//
//  UIButton+BKBackgroundColor.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BKBackgroundColor)

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)bk_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
