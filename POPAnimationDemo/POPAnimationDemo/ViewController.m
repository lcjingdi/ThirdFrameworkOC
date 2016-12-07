//
//  ViewController.m
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedTool.h"
#import <POP.h>

@interface ViewController ()
@property (nonatomic, strong) UIView  *subView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.label];
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.strokeColor = [UIColor colorWithWhite:1.0 alpha:0.98].CGColor;
    progressLayer.lineWidth = 26.0;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline moveToPoint:CGPointMake(25, 25)];
    [progressline addLineToPoint:CGPointMake(700, 25)];
    progressLayer.path = progressline.CGPath;
    
    POPSpringAnimation *scaleAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(0.3, 0.3)];
    
    POPSpringAnimation *boundsAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 800, 50)];
    boundsAnim.completionBlock = ^(POPAnimation *anim, BOOL
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [AnimatedTool numberAnimationWithView:self.label fromValue:@"10" toValue:@"100"];
}


- (void)scaleToSmall {
    [AnimatedTool scaleAnimationWithView:self.button toValue:CGSizeMake(1.25, 1.25)];
}
- (void)scaleAnimation {
    [AnimatedTool scaleAnimationWithView:self.button toValue:CGSizeMake(1.f, 1.f) velocity:CGSizeMake(3.f, 3.f) springBounds:13.f];
}
- (void)scaleToDefault {
    [AnimatedTool scaleDefaultAnimationWithView:self.button];
}
- (UIView *)subView {
    if (_subView == nil) {
        
        _subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _subView.center = self.view.center;
        _subView.backgroundColor = [UIColor redColor];
    }
    return _subView;
}
- (UIButton *)button {
    if (_button == nil) {
        
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _button.layer.cornerRadius = 10.f;
        _button.backgroundColor = [UIColor cyanColor];
        _button.center = self.view.center;
        
        [_button addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
        [_button addTarget:self action:@selector(scaleAnimation) forControlEvents:UIControlEventTouchUpInside];
        [_button addTarget:self action:@selector(scaleToDefault) forControlEvents:UIControlEventTouchDragExit];
    }
    return _button;
}
- (UILabel *)label {
    if (_label == nil) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        _label.center = self.view.center;
        _label.text = @"10";
        _label.textColor = [UIColor redColor];
    }
    return _label;
}

@end
