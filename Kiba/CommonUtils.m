//
//  CommonUtils.m
//  Kiba
//
//  Created by admin_user on 5/6/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

+ (NSString *)documentsPathForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    
    return [documentsPath stringByAppendingPathComponent:fileName];
}

+ (UIImage *)imageFromPath:(NSString *)path {
    NSData *pngData = [NSData dataWithContentsOfFile:path];
    return [UIImage imageWithData:pngData];
}

+ (BOOL)saveImageToPath:(UIImage *)image path:(NSString *)path {
    NSData *pngData = UIImagePNGRepresentation(image);
    return [pngData writeToFile:path atomically:YES]; //Write the file
}

@end
