//
//  CATransitionDemo.m
//  POPUSAGDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "CATransitionDemo.h"

@implementation CATransitionDemo
+ (void)oneView:(UIView *)view1 twoView:(UIView *)view2 {
    CATransition *transition = [CATransition animation];
    transition.startProgress = 0.0;
    transition.endProgress = 1.0;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 1.0;
    
    [view1.layer addAnimation:transition forKey:@"transition"];
    [view2.layer addAnimation:transition forKey:@"transition"];
    
    view1.hidden = YES;
    view2.hidden = NO;
}
@end
