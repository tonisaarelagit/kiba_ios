//
//  MainNavigationController.m
//  Kiba
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
    
    // Check and start dashboard page if already logged in.
    [self checkAndStart];
}

- (void)checkAndStart {
    NSString *email = [[LocalStorage shared] defaultForKey:USER_EMAIL];
    UIViewController *viewController;
    if (email) {
        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DashboardViewController"];
    } else {
        viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    }
    [self setViewControllers:@[viewController] animated:YES];
}

@end
