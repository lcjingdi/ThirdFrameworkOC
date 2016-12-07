//
//  AnimatedTool.m
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "AnimatedTool.h"
#import <POP.h>

@implementation AnimatedTool

NSString *const AnimatedToolEndNotification = @"AnimatedToolEndNotification";

+ (void)boundsAnimationWithView:(UIView *)view toValue:(CGRect)to {
    [self animatedWithView:view toValue:[NSValue valueWithCGRect:to] forKey:@"size“" type:kPOPLayerBounds];
}
+ (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to {
    [self animatedWithView:view toValue:[NSValue valueWithCGPoint:to] forKey:nil type:kPOPLayerPosition];
}
+ (void)colorAnimationWithView:(UIView *)view toValue:(UIColor *)to {
    [self animatedWithView:view toValue:(id)to.CGColor forKey:nil type:kPOPLayerBackgroundColor];
}
+ (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to {
    [self animatedWithView:view toValue:[NSValue valueWithCGSize:to] forKey:@"layerScaleSmallAnimation" type:kPOPLayerScaleXY];
}
+ (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to velocity:(CGSize)velocity springBounds:(CGFloat)bounds {
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    anim.springBounciness = 18.f;
    [view.layer pop_addAnimation:anim forKey:@"layerScaleSpringAnimation"];
}
+ (void)scaleDefaultAnimationWithView:(UIView *)view {
    [self animatedWithView:view toValue:[NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)] forKey:@"layerScaleDefaultAnimation" type:kPOPLayerScaleXY];
}
+ (void)numberAnimationWithView:(UIView *)view fromValue:(NSString *)from toValue:(NSString *)to {
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 3.0f;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = [[obj description] intValue];
        };
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"%d",(int)values[0]]];
        };
        prop.threshold = 0.01;
    }];
    anim.property = prop;
    anim.fromValue = @([from integerValue]);
    anim.toValue = @([to integerValue]);
    
    [view pop_addAnimation:anim forKey:@""];
}
+ (void)animatedWithView:(UIView *)view toValue:(NSValue *)value forKey:(NSString *)key type:(NSString *)type {
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:type];
    anim.toValue = value;
    anim.springSpeed = 0;
    [view.layer pop_addAnimation:anim forKey:key];
    
    [anim setCompletionBlock:^(POPAnimation *animation, BOOL b) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AnimatedToolEndNotification object:@""];
    }];
    
}
@end


