//
//  UIView+KeyAndData.h
//  TapBlockView
//
//  Created by LiPeng on 16/12/19.
//  Copyright © 2016年 LiPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KeyAndData)
@property (nonatomic, copy) NSString *viewKey;
@property (nonatomic, strong) id viewData;
- (UIView*)viewWithKey:(NSString*)key;
@end
