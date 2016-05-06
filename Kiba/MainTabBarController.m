//
//  MainTabBarController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "MainTabBarController.h"
#import "CameraViewController.h"

@interface MainTabBarController () <UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;
    self.delegate = self;
}

#pragma mark - UITabBarControllerDelegate Method

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (self.selectedIndex == 1) {
        CameraViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CameraViewController"];
        viewController.didDismiss = ^(NSData *data) {
            self.selectedIndex = 0;
        };
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

@end
