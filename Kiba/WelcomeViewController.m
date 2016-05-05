//
//  WelcomeViewController.m
//  Kiba
//
//  Created by admin_user on 5/4/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "WelcomeViewController.h"

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

@end
