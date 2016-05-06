//
//  ProfileViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "ProfileViewController.h"
#import "LocalStorage.h"
#import "Constants.h"

@interface ProfileViewController ()
{
    LocalStorage *localStorage;
}

@end

@implementation ProfileViewController
{
    IBOutlet UIButton *btnDeleteAccount;
    IBOutlet UIImageView *ivProfileImage;
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblEmail;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.title = @"Profile";
    
    UIColor *pink = [UIColor colorWithRed:254 / 255.f green:129 / 255.f blue:89 / 255.f alpha:1.f];
    btnDeleteAccount.layer.borderColor = pink.CGColor;
    
    localStorage = [LocalStorage shared];
    
    [self setupUserInfo];
}

#pragma mark - Setup User Info

- (void)setupUserInfo {
    lblUserName.text = @"...";
    lblEmail.text = [localStorage defaultForKey:USER_EMAIL];
}

#pragma mark - Button Delegate Methods

- (IBAction)didTapLogout:(id)sender {
    [localStorage removeDefaultForKey:USER_EMAIL];
    
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
    [self.parentViewController.navigationController setViewControllers:@[viewController] animated:YES];
}

- (IBAction)didTapDeleteAccount:(id)sender {
    [localStorage removeDefaultForKey:USER_EMAIL];
    
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
    [self.parentViewController.navigationController setViewControllers:@[viewController] animated:YES];
}

@end
