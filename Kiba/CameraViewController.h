//
//  CameraViewController.h
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController

@property (nonatomic, strong) void (^didDismiss)(NSData *someData);

@end
