//
//  MainNavigationController.m
//  ;
//
//  Created by admin_user on 4/26/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "MainNavigationController.h"
#import "LocalStorage.h"
#import "Constants.h"

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
    // Check and start dashboard page if already logged in.
    [self checkAndStart];
}

- (void)checkAndStart {
    NSString *email = [[LocalStorage shared] defaultForKey:USER_EMAIL];
    NSString *nextController;
    if (!email) {
        nextController = @"WelcomeViewController";
    } else {
        if ([[LocalStorage shared] boolForKey:GLANCED_TUTORIAL]) {
            nextController = @"DashboardViewController";
        } else {
            nextController = @"GlancePageViewController";
        }
    }
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:nextController];
    [self setViewControllers:@[viewController] animated:YES];
}

@end
