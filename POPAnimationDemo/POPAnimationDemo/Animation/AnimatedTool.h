//
//  AnimatedTool.h
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface AnimatedTool : NSObject

+ (void)boundsAnimationWithView:(UIView *)view toValue:(CGRect)to;
+ (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to;
+ (void)colorAnimationWithView:(UIView *)view toValue:(UIColor *)to;

+ (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to;
+ (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to velocity:(CGSize)velocity springBounds:(CGFloat)bounds;
+ (void)scaleDefaultAnimationWithView:(UIView *)view;

+ (void)numberAnimationWithView:(UIView *)view fromValue:(NSString *)from toValue:(NSString *)to;
@end


UIKIT_EXTERN NSString *const AnimatedToolEndNotification;
