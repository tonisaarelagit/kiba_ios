//
//  FavoriteViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "FavoriteViewController.h"

@implementation FavoriteViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.title = @"Favorites";
}

@end
