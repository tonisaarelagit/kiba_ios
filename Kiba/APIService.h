//
//  APIService.h
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

typedef void(^BlockSuccess)(NSDictionary *retDict);
typedef void(^BlockFailed)(NSString *errorMessage);

+ (void)loginWith:(NSString *)email password:(NSString *)password success:(BlockSuccess)success failed:(BlockFailed)failed;
+ (void)signupWith:(NSString *)name email:(NSString *)email password:(NSString *)password confirm:(NSString *)confirm success:(BlockSuccess)success failed:(BlockFailed)failed;

@end
