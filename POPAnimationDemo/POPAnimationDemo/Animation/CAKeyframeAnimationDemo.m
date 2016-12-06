//
//  CAKeyframeAnimationDemo.m
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/5.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "CAKeyframeAnimationDemo.h"

@implementation CAKeyframeAnimationDemo
+ (void)addBounceWithView:(UIView *)view {
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath, NULL, 0, 0);
    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,320.0,500.0, 320.0,74.0);
    
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0, 566.0,500.0, 566.0,74.0);
    CAKeyframeAnimation * theAnimation;
    // Create the animation object, specifying the position property as the key path.
    
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    theAnimation.path=thePath;
    
    theAnimation.duration=5.0;
    
    
    
    // Add the animation to the layer.
    
    [view.layer addAnimation:theAnimation forKey:@"position"];
    
    view.layer.position = CGPointMake(566, 74);
}
+ (void)addGroupAnimationWithView:(UIView *)view {
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
    group.duration = 5.0;
    
    [view.layer addAnimation:group forKey:@"BorderChanges"];
}
@end
