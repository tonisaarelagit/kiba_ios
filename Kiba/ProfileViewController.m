//
//  ProfileViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.title = @"Profile";
}

@end
