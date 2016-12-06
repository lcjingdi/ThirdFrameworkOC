//
//  CABasicAnimationDemo.m
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/5.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "CABasicAnimationDemo.h"

@implementation CABasicAnimationDemo
+ (void)addView:(UIView *)view opacity:(CGFloat)opacity {
    CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    fadeAnim.fromValue = @1.0;
    fadeAnim.toValue = @0.0;
    fadeAnim.duration = 1.0;
    
    [view.layer addAnimation:fadeAnim forKey:@"opacity"];
    
    view.layer.opacity = 0.0;
}
@end
