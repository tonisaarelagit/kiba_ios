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
#import "CommonUtils.h"
#import "UIViewController+AlertView.h"

@interface ProfileViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@end

@implementation ProfileViewController
{
    IBOutlet UIButton *btnDeleteAccount;
    IBOutlet UIImageView *ivProfileImage;
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblEmail;
    
    LocalStorage *localStorage;
    
    UIImagePickerController *imagePickerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    localStorage = [LocalStorage shared];
    
    UIColor *pink = [UIColor colorWithRed:254 / 255.f green:129 / 255.f blue:89 / 255.f alpha:1.f];
    btnDeleteAccount.layer.borderColor = pink.CGColor;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapProfileImage)];
    [ivProfileImage addGestureRecognizer:tapRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.title = @"Profile";
    
    [self setupUserInfoSection];
}

#pragma mark - Setup User Info

- (void)setupUserInfoSection {
    // Setup user profile image.
    NSString *imagePath = [CommonUtils documentsPathForFileName:PROFILE_IMAGE_FILENAME];
    UIImage *profileImage = [CommonUtils imageFromPath:imagePath];
    if (profileImage) {
        ivProfileImage.image = profileImage;
    }
    
    // Setup user name and email.
    lblUserName.text = @"...";
    lblEmail.text = [localStorage defaultForKey:USER_EMAIL];
}

#pragma mark - Button Action Methods

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

- (void)didTapProfileImage {
    if (!imagePickerView) {
        // Setup image picker view.
        imagePickerView	= [[UIImagePickerController alloc] init];
        imagePickerView.delegate = self;
        imagePickerView.allowsEditing = YES;
    }
    
    // Launch actionsheet.
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Take a Photo"
                                                    otherButtonTitles:@"Select from Photo Library", nil];
    actionSheet.delegate = self;
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.destructiveButtonIndex = 2;
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheet Delegate Method

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerView.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePickerView animated:YES completion:nil];
            } else {
                [self showSimpleAlertWithTitle:@"Sorry!" message:@"Camera is not available"];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                imagePickerView.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePickerView animated:YES completion:nil];
            } else {
                [self showSimpleAlertWithTitle:@"Sorry!" message:@"Photo Library is Not Available"];
            }
            break;
    }
}

#pragma mark - ImagePickerControllerDelegate Methods

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    ivProfileImage.image = selectedImage;
    
    NSString *path = [CommonUtils documentsPathForFileName:PROFILE_IMAGE_FILENAME];
    [CommonUtils saveImageToPath:selectedImage path:path];
}

@end
