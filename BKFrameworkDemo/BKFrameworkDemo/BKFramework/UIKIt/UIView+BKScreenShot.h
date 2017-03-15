//
//  UIView+BKScreenShot.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/15.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BKScreenShot)

/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;


@end
