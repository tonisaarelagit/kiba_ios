//
//  UIUtils.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "UIUtils.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIUtils

+ (void)animateBorder:(UIView *)view {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    animation.fromValue = (id)[UIColor clearColor].CGColor;
    animation.toValue = (id)[UIColor redColor].CGColor;
    animation.duration = 0.1f;
    animation.repeatCount = 3;
    animation.autoreverses = YES;
    view.layer.borderWidth = 2;
    view.layer.borderColor = [UIColor clearColor].CGColor;
    [view.layer addAnimation:animation forKey:@"borderAnimation"];
}

+ (void)showIndetermineProgressIn:(UIView *)view withMessage:(NSString *)message {
    MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:view animated:YES];
    progress.dimBackground = YES;
    progress.labelText = message;
}

+ (void)dismissProgressIn:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
