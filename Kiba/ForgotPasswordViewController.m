//
//  ForgotPasswordViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "UIUtils.h"
#import "ValidationUtils.h"
#import "UIViewController+AlertView.h"

@implementation ForgotPasswordViewController
{
    IBOutlet UITextField *tfEmail;
}

#pragma mark - Button Action Methods

- (IBAction)didTapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapDoneButton:(id)sender {
    [self checkAndSubmit];
}

#pragma mark - Check & Submit Request

- (void)checkAndSubmit {
    NSString *email = tfEmail.text;
    if (email.length == 0) {
        [UIUtils animateBorder:tfEmail];
    } else if (![ValidationUtils isValidEmail:email]) {
        [self showSimpleAlertWithTitle:@"Input error!" message:@"Invalid email"];
    } else {
        [tfEmail resignFirstResponder];
        [self showSimpleAlertWithTitle:@"Alert" message:@"You will have an notification email with new password"];
    }
}

@end
