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
{
    IBOutlet UILabel *lblEmail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *email = [[LocalStorage shared] defaultForKey:USER_EMAIL];
    lblEmail.text = email;
}

#pragma mark - Button Action Methods

- (IBAction)didTapLogoutButton:(id)sender {
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController setViewControllers:@[controller] animated:YES];
    
    [[LocalStorage shared] removeDefaultForKey:USER_EMAIL];
}

@end
