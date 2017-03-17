//
//  UIButton+BKBlock.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BKTouchedButtonBlock)(UIButton *sender);

@interface UIButton (BKBlock)

- (void)addActionHandler:(BKTouchedButtonBlock)touchHandler;

@end
