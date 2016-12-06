//
//  ViewController.m
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedProgressView.h"
#import "AnimatedTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AnimatedProgressView *view = [[AnimatedProgressView alloc] initWithFrame:CGRectMake(50, 100, 200, 33)];
    [self.view addSubview:view];
    
    AnimatedProgressView *view2 = [[AnimatedProgressView alloc] initWithFrame:CGRectMake(50, 200, 200, 33)];
    [self.view addSubview:view2];
    
    AnimatedProgressView *view3 = [[AnimatedProgressView alloc] initWithFrame:CGRectMake(50, 300, 200, 33)];
    [self.view addSubview:view3];
    
    AnimatedProgressView *view4 = [[AnimatedProgressView alloc] initWithFrame:CGRectMake(50, 400, 200, 33)];
    [self.view addSubview:view4];
    
    [AnimatedTool layerAnimationWithLayer:view.subLayer fromValue:0 toValue:1];
    [AnimatedTool layerAnimationWithLayer:view2.subLayer fromValue:0 toValue:1];
    [AnimatedTool layerAnimationWithLayer:view3.subLayer fromValue:0 toValue:1];
    [AnimatedTool layerAnimationWithLayer:view4.subLayer fromValue:0 toValue:1];
}


@end
