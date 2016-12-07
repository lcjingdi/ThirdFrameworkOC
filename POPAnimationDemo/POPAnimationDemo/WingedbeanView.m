//
//  WingedbeanView.m
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/7.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "WingedbeanView.h"
#import "AnimatedTool2.h"

@interface WingedbeanView()
// 背景View
@property (nonatomic, strong) UIView *backgroundView;
// 背景图片View
@property (nonatomic, strong) UIImageView *backgroundImageView;
// 小人View
@property (nonatomic, strong) UIImageView *cartoonImageView;
// 标题Label
@property (nonatomic, strong) UILabel *titleLabel;
// 翼豆增加View
@property (nonatomic, strong) UIView *beanAddView;
// 经验增加View
@property (nonatomic, strong) UIView *expAddView;
// 翼豆图片
@property (nonatomic, strong) UIImageView *beanImageView;
// 经验图片
@property (nonatomic, strong) UIImageView *expImageView;
@property (nonatomic, strong) UILabel *beanLabel;
@property (nonatomic, strong) UILabel *expLabel;
@property (nonatomic, strong) UILabel *addLabel1;
@property (nonatomic, strong) UILabel *addLabel2;
// 加号

@end

@implementation WingedbeanView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textxxoo:) name:AnimatedToolEndNotification2 object:nil];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textxxoo:) name:AnimatedToolEndNotification2 object:nil];
    }
    return self;
}
- (void)showInView:(UIView *)view {
    if (view) {
        // add Views
        [self addSubview:self.backgroundView];
        
        [self.backgroundView addSubview:self.backgroundImageView];
        [self.backgroundView addSubview:self.cartoonImageView];
        
        [[AnimatedTool2 sharedAnimatedTool] scaleAnimationWithView:self.backgroundImageView toValue:CGSizeMake(2, 2) keyPath:@"xxxx1" velocity:CGSizeMake(5, 5) springBounds:20];
        [[AnimatedTool2 sharedAnimatedTool] scaleAnimationWithView:self.cartoonImageView toValue:CGSizeMake(2, 2) keyPath:@"xxxx2" velocity:CGSizeMake(5, 5) springBounds:20];
        
        [view addSubview:self];
    }
}
- (void)dismiss {
    [self removeFromSuperview];
}

#pragma mark - lazy
- (UIView *)backgroundView {
    if (_backgroundView == nil) {
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 300)];
        _backgroundView.center = self.center;

    }
    return _backgroundView;
}
- (UIImageView *)cartoonImageView {
    if (_cartoonImageView == nil) {
        
        _cartoonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        _cartoonImageView.contentMode = UIViewContentModeScaleAspectFit;
        _cartoonImageView.image = [UIImage imageNamed:@"baobao"];
        _cartoonImageView.center = CGPointMake(self.backgroundView.frame.size.width / 2.0, self.backgroundView.frame.size.height / 2.0 - 35);
    }
    return _cartoonImageView;
}
- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 77.5)];
        _backgroundImageView.image = [UIImage imageNamed:@"caidai"];
        _backgroundImageView.center = CGPointMake(self.backgroundView.frame.size.width / 2.0, self.backgroundView.frame.size.height / 2.0);
    }
    return _backgroundImageView;
}
- (void)textxxoo:(NSNotification *)notification {
    if ([notification.object[@"keyPath"] isEqualToString:@"xxxx2"]) {
        [self.backgroundView addSubview:self.beanImageView];
        [self.backgroundView addSubview:self.expImageView];
        [self.backgroundView addSubview:self.titleLabel];

        [[AnimatedTool2 sharedAnimatedTool] positionAnimationWithView:self.beanImageView toValue:CGPointMake(CGRectGetMaxX(self.cartoonImageView.frame) - 10, 20) keyPath:@"xxxx3" velocity:CGSizeMake(5, 5) springBounds:20];
        [[AnimatedTool2 sharedAnimatedTool] positionAnimationWithView:self.expImageView toValue:CGPointMake(CGRectGetMaxX(self.cartoonImageView.frame) - 10, 55) keyPath:@"xxxx4" velocity:CGSizeMake(5, 5) springBounds:20];
        [[AnimatedTool2 sharedAnimatedTool] scaleAnimationWithView:self.beanImageView toValue:CGSizeMake(2, 2) keyPath:@"xxxx5"];
        [[AnimatedTool2 sharedAnimatedTool] scaleAnimationWithView:self.expImageView toValue:CGSizeMake(2, 2) keyPath:@"xxxx6"];
    } else if([notification.object[@"keyPath"] isEqualToString:@"xxxx3"]){
        [self.backgroundView addSubview:self.addLabel1];
        [self.backgroundView addSubview:self.addLabel2];
        [self.backgroundView addSubview:self.beanLabel];
        [self.backgroundView addSubview:self.expLabel];
//        [[AnimatedTool2 sharedAnimatedTool] numberAnimationWithView:self.beanLabel fromValue:@"0" toValue:@"1000" keyPath:@"xxxx7"];
//        [[AnimatedTool2 sharedAnimatedTool] numberAnimationWithView:self.expLabel fromValue:@"0" toValue:@"500" keyPath:@"xxxx8"];
    } else if ([notification.object[@"keyPath"] isEqualToString:@"xxxx7"]) {
        
    }
    
}
- (void)animationDidStart {
    NSLog(@"animationDidStart");
}
- (void)animationDidStop {
    [self.backgroundView addSubview:self.titleLabel];
//    [[AnimatedTool sharedAnimatedTool] scaleAnimationWithView:self.cartoonImageView toValue:CGSizeMake(2, 2)];
}
- (UIImageView *)beanImageView {
    if (_beanImageView == nil) {
        
        _beanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _beanImageView.image = [UIImage imageNamed:@"bean"];
        _beanImageView.center = CGPointMake(self.backgroundView.frame.size.width / 2.0, self.backgroundView.frame.size.height / 2.0- 10);
    }
    return _beanImageView;
}
- (UIImageView *)expImageView {
    if (_expImageView == nil) {
        
        _expImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _expImageView.image = [UIImage imageNamed:@"exp"];
        _expImageView.center = CGPointMake(self.backgroundView.frame.size.width / 2.0, self.backgroundView.frame.size.height / 2.0);
    }
    return _expImageView;
}
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.backgroundView.frame.size.width, 44)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.text = self.contentText ? self.contentText : @"";
        _titleLabel.center = CGPointMake(self.backgroundView.center.x, CGRectGetMaxY(self.cartoonImageView.frame) + 20);
    }
    return _titleLabel;
}
- (UILabel *)beanLabel {
    if (_beanLabel == nil) {
        
        _beanLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.addLabel1.frame) + 6, self.addLabel1.frame.origin.y, 100, 30)];
        _beanLabel.font = [UIFont systemFontOfSize:21];
        _expLabel.textColor = [UIColor blueColor];
        _beanLabel.text = @"100";
    }
    return _beanLabel;
}
- (UILabel *)expLabel {
    if (_expLabel == nil) {
        
        _expLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.addLabel2.frame) + 6, self.addLabel2.frame.origin.y, 100, 30)];
        _expLabel.font = [UIFont systemFontOfSize:21];
        _expLabel.textColor = [UIColor redColor];
        
        _expLabel.text = @"100";
    }
    return _expLabel;
}
- (UILabel *)addLabel1 {
    if (_addLabel1 == nil) {
        _addLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.beanImageView.frame) - 5, self.beanImageView.frame.origin.y, 20, 30)];
        _addLabel1.font = [UIFont systemFontOfSize:21];
        _addLabel1.textAlignment = NSTextAlignmentRight;
        _addLabel1.textColor = [UIColor blueColor];
        _addLabel1.text = @"+";
    }
    return _addLabel1;
}
- (UILabel *)addLabel2 {
    if (_addLabel2 == nil) {
        _addLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.expImageView.frame) - 5, self.expImageView.frame.origin.y, 20, 30)];
        _addLabel2.font = [UIFont systemFontOfSize:21];
        _addLabel2.textColor = [UIColor redColor];
        _addLabel2.textAlignment = NSTextAlignmentRight;
        _addLabel2.text = @"+";
    }
    return _addLabel2;
}
@end
