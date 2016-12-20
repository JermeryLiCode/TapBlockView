//
//  ViewActionGestureRecognizer.h
//  TapBlockView
//
//  Created by LiPeng on 16/12/19.
//  Copyright © 2016年 LiPeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ViewActionBlock)(UIView* sender);
@interface ViewActionGestureRecognizer : UIGestureRecognizer<UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIView *target;
@property (nonatomic, strong) ViewActionBlock action;

@end


@interface UIView (ViewAction)
- (void)viewAction:(ViewActionBlock)block;
@end
