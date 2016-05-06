//
//  CameraViewController.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController
{
    IBOutlet UIButton *btnCancel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnCancel.transform = CGAffineTransformMakeRotation(M_PI_2);
}

#pragma mark - Button Action Methods

- (IBAction)didTapCancel:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    if (self.didDismiss) {
        self.didDismiss(nil);
    }
}

@end
