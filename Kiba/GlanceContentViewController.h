//
//  GlanceContentViewController.h
//  Kiba
//
//  Created by admin_user on 5/5/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GlanceContentViewControllerDelegate <NSObject>

- (void)didFinishTutorial;

@end

@interface GlanceContentViewController : UIViewController

@property (nonatomic, strong) id delegate;

@end
