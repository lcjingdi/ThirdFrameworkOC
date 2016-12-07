//
//  WingedbeanView.h
//  POPAnimationDemo
//
//  Created by jingdi on 2016/12/7.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WingedbeanView : UIView

@property (nonatomic, copy) NSString *contentText;

- (void)showInView:(UIView *)view;
- (void)dismiss;
@end
