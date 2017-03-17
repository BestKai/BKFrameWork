//
//  NSObject+BKAdd.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/17.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "NSObject+BKAdd.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation NSObject (BKAdd)

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)setAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAssociateWeakValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

- (id)getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}

- (NSString *)className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}


@end
