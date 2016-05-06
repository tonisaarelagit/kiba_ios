//
//  SignupViewController.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "SignupViewController.h"
#import "UIViewController+AlertView.h"
#import "UIUtils.h"
#import "ValidationUtils.h"
#import "APIService.h"
#import "LocalStorage.h"
#import "Constants.h"

@interface SignupViewController() <UITextFieldDelegate>

@end

@implementation SignupViewController
{
    IBOutlet UITextField *tfName;
    IBOutlet UITextField *tfEmail;
    IBOutlet UITextField *tfPassword;
    IBOutlet UITextField *tfConfirm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == tfName) {
        [tfEmail becomeFirstResponder];
    } else if (textField == tfEmail) {
        [tfPassword becomeFirstResponder];
    } else if (textField == tfPassword) {
        [tfConfirm becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return NO; // We do not want UITextField to insert line-breaks.
}

#pragma mark - Button Action Methods

- (IBAction)didTapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapDoneButton:(id)sender {
    [self checkAndRequestSignup];
}

#pragma mark - Check & Make Signup Request

- (void)checkAndRequestSignup {
    NSString *name = tfName.text;
    NSString *email = tfEmail.text;
    NSString *password = tfPassword.text;
    NSString *confirm = tfConfirm.text;
    if (name.length == 0) {
        [UIUtils animateBorder:tfName];
    } else if (email.length == 0) {
        [UIUtils animateBorder:tfEmail];
    } else if (![ValidationUtils isValidEmail:email]) {
        [self showSimpleAlertWithTitle:@"Input error!" message:@"Invalid email"];
    } else if (password.length == 0) {
        [UIUtils animateBorder:tfPassword];
    } else if (confirm.length == 0) {
        [UIUtils animateBorder:tfConfirm];
    } else if (![password isEqualToString:confirm]) {
        [self showSimpleAlertWithTitle:@"Input error!" message:@"Confirm password mismatch"];
    } else {
        // Send signup request.
        [tfName resignFirstResponder];
        [tfEmail resignFirstResponder];
        [tfPassword resignFirstResponder];
        [tfConfirm resignFirstResponder];
        
        [UIUtils showIndetermineProgressIn:self.view withMessage:@"Signup..."];
        [APIService signupWith:name email:email password:password confirm:confirm success:^(NSDictionary *retDict) {
            [UIUtils dismissProgressIn:self.view];
            
            NSInteger status = [retDict[@"status"] intValue];
            if (status == 0) {
                NSString *errorMessage = retDict[@"message"];
                [self showSimpleAlertWithTitle:@"Error" message:errorMessage];
            } else {
                // Save user info and navigate to dashboard.
                [[LocalStorage shared] setDefault:email forKey:USER_EMAIL];
                [[LocalStorage shared] setDefault:password forKey:USER_PASS];
                [self navigateToDashboard];
            }
        } failed:^(NSString *errorMessage) {
            [UIUtils dismissProgressIn:self.view];
            [self showSimpleAlertWithTitle:@"Network Error" message:errorMessage];
        }];
    }
}

- (void)navigateToDashboard {
    BOOL glancedTutorial = [[LocalStorage shared] boolForKey:GLANCED_TUTORIAL];
    NSString *identifier;
    if (glancedTutorial) {
        identifier = @"DashboardViewController";
    } else {
        identifier = @"GlancePageViewController";
    }
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:controller animated:YES];
}

@end


