//
//  AnimatedProgressView.m
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/7.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "AnimatedProgressView.h"

@implementation AnimatedProgressView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = frame.size.height / 2.0f;
        self.backgroundColor =[UIColor redColor];
        [self.layer setMasksToBounds:YES];
        
        CAShapeLayer *progressLayer = [CAShapeLayer layer];
        progressLayer.strokeColor = [UIColor blueColor].CGColor;
        progressLayer.lineCap   = kCALineCapRound;
        progressLayer.lineJoin  = kCALineJoinBevel;
        progressLayer.lineWidth = frame.size.height - frame.size.height / 2.0f;
        progressLayer.strokeEnd = frame.size.height / 2.0f;
        
        UIBezierPath *progressline = [UIBezierPath bezierPath];
        [progressline moveToPoint:CGPointMake(frame.size.height / 2.0f, frame.size.height / 2.0f)];
        [progressline addLineToPoint:CGPointMake(frame.size.width - frame.size.height / 2.0f, frame.size.height / 2.0f)];
        progressLayer.path = progressline.CGPath;
        
        [self.layer addSublayer:progressLayer];
        self.subLayer = progressLayer;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.strokeColor = [UIColor blueColor].CGColor;
    progressLayer.lineCap   = kCALineCapRound;
    progressLayer.lineJoin  = kCALineJoinBevel;
    progressLayer.lineWidth = 18;
    progressLayer.strokeEnd = 0.0;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline moveToPoint:CGPointMake(12.5, 12.5)];
    [progressline addLineToPoint:CGPointMake(187.5, 12.5)];
    progressLayer.path = progressline.CGPath;
    
    [self.layer addSublayer:progressLayer];
}

@end
