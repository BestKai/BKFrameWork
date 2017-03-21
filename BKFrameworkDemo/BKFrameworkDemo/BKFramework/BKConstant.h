//
//  BKConstant.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/21.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#ifndef BKConstant_h
#define BKConstant_h

#import "BKUtilities.h"

static const CGFloat BKStatusBarHeight = 20;
static const CGFloat BKNavigationBarHeight = 44;
static const CGFloat BKStatusAndNavigationHeight = (BKStatusBarHeight + BKNavigationBarHeight);
static const CGFloat BKTabbarHeight = 49;



#pragma mark --- device

#ifndef kIsIphone4
#define kIsIphone4 (kScreenHeight == 480)
#endif

#ifndef kIsIphone5
#define kIsIphone5 (kScreenHeight == 568)
#endif

#ifndef kIsIphone6
#define kIsIphone6 (kScreenHeight == 667)
#endif

#ifndef kIsIphone6P
#define kIsIphone6P (kScreenHeight == 736)
#endif



#pragma mark --- systemVersion

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#ifndef kiOS10Later
#define kiOS10Later (kSystemVersion >= 10)
#endif




#pragma mark --- Others

#ifndef SINGLE_LINE_HEIGHT
#define SINGLE_LINE_HEIGHT (1/BKScreenScale())
#endif



#endif /* BKConstant_h */
