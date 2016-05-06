//
//  CommonUtils.h
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonUtils : NSObject

+ (NSString *)documentsPathForFileName:(NSString *)fileName;

+ (UIImage *)imageFromPath:(NSString *)path;

+ (BOOL)saveImageToPath:(UIImage *)image path:(NSString *)path;

@end
