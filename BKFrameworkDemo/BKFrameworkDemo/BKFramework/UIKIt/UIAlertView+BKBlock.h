//
//  UIAlertView+BKBlock.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UIAlertViewBKCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (BKBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewBKCallBackBlock bk_alertViewCallBackBlock;


+ (void)alertWithCallBackBlock:(UIAlertViewBKCallBackBlock)alertViewCallBackBlock
                            title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
