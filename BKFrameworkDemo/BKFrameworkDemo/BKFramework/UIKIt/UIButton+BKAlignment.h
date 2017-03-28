//
//  UIButton+BKAlignment.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BKAlignment)

//上下居中，图片在上，文字在下
- (void)bk_verticalCenterImageAndTitle:(CGFloat)spacing;
- (void)bk_verticalCenterImageAndTitle; //默认6.0

//左右居中，文字在左，图片在右
- (void)bk_horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)bk_horizontalCenterTitleAndImage; //默认6.0

//左右居中，图片在左，文字在右
- (void)bk_horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)bk_horizontalCenterImageAndTitle; //默认6.0

//文字居中，图片在左边
- (void)bk_horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)bk_horizontalCenterTitleAndImageLeft; //默认6.0

//文字居中，图片在右边
- (void)bk_horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)bk_horizontalCenterTitleAndImageRight; //默认6.0


@end
