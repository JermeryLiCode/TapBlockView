//
//  UIView+KeyAndData.m
//  TapBlockView
//
//  Created by LiPeng on 16/12/19.
//  Copyright © 2016年 LiPeng. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+KeyAndData.h"

static char viewKeyKey;
static char viewDataKey;

@implementation UIView (KeyAndData)
@dynamic viewKey,viewData;
- (NSString*)viewKey {
    return objc_getAssociatedObject(self, &viewKeyKey);
}
- (void)setViewKey:(NSString *)viewKey {
    objc_setAssociatedObject(self, &viewKeyKey, viewKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView*)viewWithKey:(NSString *)key {
    if ([self.viewKey isEqualToString:key]) {
        return self;
    }
    for (UIView *sub in self.subviews) {
        UIView *ret = [sub viewWithKey:key];
        if (nil != ret) {
            return ret;
        }
    }
    return nil;
}
- (id)viewData {
    id ret = objc_getAssociatedObject(self, &viewDataKey);
    if (ret != nil) {
        return ret;
    }
    UIView *superview = [self superview];
    if (superview != nil) {
        return [superview viewData];
    } else {
        return nil;
    }
}
- (void)setSpyData:(id)spyData {
    objc_setAssociatedObject(self, &viewDataKey, spyData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
