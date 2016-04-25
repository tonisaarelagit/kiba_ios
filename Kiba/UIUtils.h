//
//  UIUtils.h
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIUtils : NSObject

+ (void)animateBorder:(UIView *)view;

+ (void)showIndetermineProgressIn:(UIView *)view withMessage:(NSString *)message;

+ (void)dismissProgressIn:(UIView *)view;

@end
