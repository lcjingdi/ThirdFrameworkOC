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
static AnimatedTool *_instance = nil;

+ (instancetype)sharedAnimatedTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)boundsAnimationWithView:(UIView *)view toValue:(CGRect)to {
    [self animatedWithView:view toValue:[NSValue valueWithCGRect:to] forKey:@"size“" type:kPOPLayerBounds];
}
- (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to keyPath:(NSString *)keyPath{
    [self animatedWithView:view toValue:[NSValue valueWithCGPoint:to] forKey:keyPath type:kPOPLayerPosition];
}
- (void)positionAnimationWithView:(UIView *)view toValue:(CGPoint)to keyPath:(NSString *)keyPath velocity:(CGSize)velocity springBounds:(CGFloat)bounds {
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    anim.toValue = [NSValue valueWithCGPoint:to];
    anim.springSpeed = 20;
    [view.layer pop_addAnimation:anim forKey:keyPath];
    
    [anim setCompletionBlock:^(POPAnimation *animation, BOOL b) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AnimatedToolEndNotification object:@{@"keyPath": keyPath, @"type": kPOPLayerPosition}];
    }];
}
- (void)colorAnimationWithView:(UIView *)view toValue:(UIColor *)to {
    [self animatedWithView:view toValue:(id)to.CGColor forKey:nil type:kPOPLayerBackgroundColor];
}

- (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to keyPath:(NSString *)keyPath {
    [self animatedWithView:view toValue:[NSValue valueWithCGSize:to] forKey:keyPath type:kPOPLayerScaleXY];
}
- (void)scaleAnimationWithView:(UIView *)view toValue:(CGSize)to keyPath:(NSString *)keyPath velocity:(CGSize)velocity springBounds:(CGFloat)bounds {
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.velocity = [NSValue valueWithCGSize:velocity];
    anim.toValue = [NSValue valueWithCGSize:to];
    anim.springBounciness = bounds;
    [view.layer pop_addAnimation:anim forKey:keyPath];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL b) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AnimatedToolEndNotification object:@{@"keyPath": keyPath, @"type": kPOPLayerScaleXY}];
    }];
}
- (void)scaleDefaultAnimationWithView:(UIView *)view {
    [self animatedWithView:view toValue:[NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)] forKey:@"layerScaleDefaultAnimation" type:kPOPLayerScaleXY];
}

- (void)numberAnimationWithView:(UIView *)view fromValue:(NSString *)from toValue:(NSString *)to keyPath:(NSString *)keyPath {
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
    
    [view pop_addAnimation:anim forKey:keyPath];
}
- (void)layerAnimationWithLayer:(CALayer *)layer fromValue:(CGFloat)from toValue:(CGFloat)to {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0.0);
    POPBasicAnimation *progressBoundsAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    progressBoundsAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    progressBoundsAnim.duration = 1.0;
    progressBoundsAnim.fromValue = [NSNumber numberWithFloat:from];
    progressBoundsAnim.toValue = [NSNumber numberWithFloat:to];
    
    [layer pop_addAnimation:progressBoundsAnim forKey:@"AnimateBounds"];
    progressBoundsAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            UIGraphicsEndImageContext();
        }
    };

}
- (void)animatedWithView:(UIView *)view toValue:(NSValue *)value forKey:(NSString *)key type:(NSString *)type {
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:type];
    anim.delegate = self;
    anim.toValue = value;
    anim.springSpeed = 0;
    [view.layer pop_addAnimation:anim forKey:key];

    [anim setCompletionBlock:^(POPAnimation *animation, BOOL b) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AnimatedToolEndNotification object:@{@"keyPath": key, @"type": type}];
    }];
    
}

@end


