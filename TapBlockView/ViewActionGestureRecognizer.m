//
//  ViewActionGestureRecognizer.m
//  TapBlockView
//
//  Created by LiPeng on 16/12/19.
//  Copyright © 2016年 LiPeng. All rights reserved.
//

#import "ViewActionGestureRecognizer.h"
#import "UIView+KeyAndData.h"
@implementation ViewActionGestureRecognizer

- (id)init {
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}
static NSString *maskKey = @"ViewActionGestureRecognizerMaskKey";
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *mask = [self.target viewWithKey:maskKey];
    if (nil == mask) {
        mask = [[UIView alloc] initWithFrame:self.target.bounds];
        mask.userInteractionEnabled = NO;
        mask.backgroundColor = [UIColor blackColor];
        mask.alpha = 0.24;
        mask.viewKey = maskKey;
        [self.target addSubview:mask];
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    UIView *mask = [self.target viewWithKey:maskKey];
    [mask removeFromSuperview];
    return NO;
}
- (BOOL)touchInView {
    CGPoint pt = [self locationInView:self.target];
    return CGRectContainsPoint(self.target.bounds, pt);
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *mask = [self.target viewWithKey:maskKey];
    [mask removeFromSuperview];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *mask = [self.target viewWithKey:maskKey];
    [mask removeFromSuperview];
    if ([self touchInView] && self.action) {
        self.action(self.target);
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *mask = [self.target viewWithKey:maskKey];
    if ([self touchInView]) {
        mask.hidden = NO;
    } else {
        mask.hidden = YES;
    }
}
@end

@implementation UIView (ViewAction)

- (void)viewAction:(ViewActionBlock)block {
    self.userInteractionEnabled =YES;
    ViewActionGestureRecognizer *gr = [[ViewActionGestureRecognizer alloc] init];
    gr.target = self;
    gr.action = block;
    [self addGestureRecognizer:gr];
}

@end

