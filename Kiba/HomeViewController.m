//
//  HomeViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.title = @"Kiba Gallery";
}

@end
