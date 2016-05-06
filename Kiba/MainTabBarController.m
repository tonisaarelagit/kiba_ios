//
//  MainTabBarController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "MainTabBarController.h"

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
}

@end
