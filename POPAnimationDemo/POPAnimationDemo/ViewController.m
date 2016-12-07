//
//  ViewController.m
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/6.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedTool.h"
#import "WingedbeanView.h"

@interface ViewController ()

@property (nonatomic, strong) WingedbeanView *beanView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.beanView];
    self.beanView.contentText = @"上传头像成功";
    [self.beanView showInView:self.view];
}

- (WingedbeanView *)beanView {
    if (_beanView == nil) {
        _beanView = [[WingedbeanView alloc] initWithFrame:self.view.bounds];
        _beanView.userInteractionEnabled = NO;
    }
    return _beanView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.beanView dismiss];
}
@end
