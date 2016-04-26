//
//  DashboardViewController.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "DashboardViewController.h"
#import "LocalStorage.h"
#import "Constants.h"

@implementation DashboardViewController

#pragma mark - Button Action Methods

- (IBAction)didTapLogoutButton:(id)sender {
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController setViewControllers:@[controller] animated:YES];
}

@end
