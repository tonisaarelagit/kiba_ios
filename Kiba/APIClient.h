//
//  APIClient.h
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface APIClient : NSObject

typedef void (^APIClientSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void (^APIClientFailure)(NSURLSessionDataTask *task, NSError *error);

+ (APIClient *)sharedClient;

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

- (void)GET:(NSString *)path params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure;
- (void)POST:(NSString *)path params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure;

@end
