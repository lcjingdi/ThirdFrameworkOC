//
//  AnimatedTool.h
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//
#import <UIKit/UIKit.h>

//@protocol AnimatedToolDelegate <NSObject>
//
//- (void)animationDidStart;
//- (void)animationDidStop;
//
//@end

@interface AnimatedTool : NSObject

//@property (nonatomic, weak) id<AnimatedToolDelegate> delegate;

+ (instancetype)sharedAnimatedTool;

- (void)boundsAnimationWithView:(UIView *)view toValue:(CGRect)to;
- (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to keyPath:(NSString *)keyPath;
- (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to keyPath:(NSString *)keyPath velocity:(CGSize)velocity springBounds:(CGFloat)bounds;
- (void)colorAnimationWithView:(UIView *)view toValue:(UIColor *)to;

- (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to keyPath:(NSString *)keyPath;
- (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to keyPath:(NSString *)keyPath velocity:(CGSize)velocity springBounds:(CGFloat)bounds;
- (void)scaleDefaultAnimationWithView:(UIView *)view;


- (void)numberAnimationWithView:(UIView *)view fromValue:(NSString *)from toValue:(NSString *)to keyPath:(NSString *)keyPath;
- (void)layerAnimationWithLayer:(CALayer *)layer fromValue:(CGFloat)from toValue:(CGFloat)to;

@end


UIKIT_EXTERN NSString *const AnimatedToolEndNotification;
