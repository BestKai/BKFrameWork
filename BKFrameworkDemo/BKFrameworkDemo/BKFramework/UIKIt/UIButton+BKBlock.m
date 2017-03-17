//
//  UIButton+BKBlock.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/16.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "UIButton+BKBlock.h"
#import <objc/runtime.h>

static const void *bk_UIButtonBlockKey = &bk_UIButtonBlockKey;


@implementation UIButton (BKBlock)

- (void)addActionHandler:(BKTouchedButtonBlock)touchHandler
{
    objc_setAssociatedObject(self, bk_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(bk_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)bk_blockActionTouched:(UIButton *)btn{
    BKTouchedButtonBlock block = objc_getAssociatedObject(self, bk_UIButtonBlockKey);
    if (block) {
        block(btn);
    }
}

@end

