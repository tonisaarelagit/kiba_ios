//
//  APIService.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "APIService.h"
#import "APIClient.h"

@implementation APIService

#pragma mark - Login Endpoint

+ (void)loginWith:(NSString *)email password:(NSString *)password success:(BlockSuccess)success failed:(BlockFailed)failed {
    NSDictionary *params = @{
                             @"username"    : email,
                             @"password"    : password
                             };
    [self makePost:@"/login" params:params success:success failed:failed];
}

#pragma mark - Signup Endpoint

+ (void)signupWith:(NSString *)name email:(NSString *)email password:(NSString *)password confirm:(NSString *)confirm success:(BlockSuccess)success failed:(BlockFailed)failed {
    NSDictionary *params = @{
                             @"signupName"      : name,
                             @"signupID"        : email,
                             @"signupPassword"  : password,
                             @"signupDupPassword" : confirm
                             };
    [self makePost:@"/signup" params:params success:success failed:failed];
}

#pragma mark - Get User Name

+ (void)getUserName:(BlockSuccess)success failed:(BlockFailed)failed {
    [self makeGet:@"/username" params:nil success:success failed:failed];
}

#pragma mark - Make Post Request

+ (void)makePost:(NSString *)path params:(NSDictionary *)params success:(BlockSuccess)success failed:(BlockFailed)failed {
    [[APIClient sharedClient] POST:path params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableDictionary *response = (NSMutableDictionary *) responseObject;
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error.localizedDescription);
    }];
}

#pragma mark - Make Get Request

+ (void)makeGet:(NSString *)path params:(NSDictionary *)params success:(BlockSuccess)success failed:(BlockFailed)failed {
    [[APIClient sharedClient] GET:path params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableDictionary *response = (NSMutableDictionary *) responseObject;
        success(response);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error.localizedDescription);
    }];
}

@end
