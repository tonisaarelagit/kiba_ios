//
//  LoginViewController.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "LoginViewController.h"
#import "UIUtils.h"
#import "ValidationUtils.h"
#import "APIService.h"
#import "UIViewController+AlertView.h"

@interface LoginViewController() <UITextFieldDelegate>

@end

@implementation LoginViewController
{
    IBOutlet UITextField *tfEmail;
    IBOutlet UITextField *tfPassword;
}

#pragma mark - UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == tfEmail) {
        [tfPassword becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

#pragma mark - Button Action Methods

- (IBAction)didTapLoginButton:(id)sender {
    [self checkAndSubmitLoginRequest];
}

- (IBAction)didTapSignupButton:(id)sender {
    
}

#pragma mark - Check & Submit Login Request

- (void)checkAndSubmitLoginRequest {
    NSString *email = tfEmail.text;
    NSString *password = tfPassword.text;
    if (email.length == 0) {
        [UIUtils animateBorder:tfEmail];
    } else if (![ValidationUtils isValidEmail:email]) {
        [UIUtils animateBorder:tfEmail];
    } else if (password.length == 0) {
        [UIUtils animateBorder:tfPassword];
    } else {
        // Submit login request here.
        [tfEmail resignFirstResponder];
        [tfPassword resignFirstResponder];
        
        [UIUtils showIndetermineProgressIn:self.view withMessage:@"Login..."];
        [APIService loginWith:email password:password success:^(NSDictionary *retDict) {
            [UIUtils dismissProgressIn:self.view];
            
            NSInteger status = [retDict[@"status"] intValue];
            if (status == 0) {
                NSString *errorMessage = retDict[@"message"];
                [self showSimpleAlertWithTitle:@"Error" message:errorMessage];
            } else {
                [self showSimpleAlertWithTitle:@"Success" message:@"Login Success"];
            }
        } failed:^(NSString *errorMessage) {
            [UIUtils dismissProgressIn:self.view];
            [self showSimpleAlertWithTitle:@"Error" message:errorMessage];
        }];
    }
}

@end



