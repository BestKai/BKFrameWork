//
//  BKUtilities.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/21.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#ifndef BKUtilities_h
#define BKUtilities_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


/// Get main screen's scale.
CGFloat BKScreenScale();

/// Get main screen's size. Height is always larger than width.
CGSize BKScreenSize();


// main screen's scale
#ifndef kScreenScale
#define kScreenScale BKScreenScale()
#endif

// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize BKScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth BKScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight BKScreenSize().height
#endif



#endif /* BKUtilities_h */
