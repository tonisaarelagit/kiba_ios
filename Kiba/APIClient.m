//
//  APIClient.m
//  Kiba
//
//  Created by admin_user on 4/25/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "APIClient.h"

#define BASE_URL @"http://joy.getkiba.com"

@implementation APIClient

#pragma mark - Get Shared Instance

+ (APIClient *)sharedClient {
    static APIClient *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma mark - Initialize

- (id)init{
    if (self = [super init]) {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    }
    return self;
}

#pragma mark - Make HTTP Requests

- (void)GET:(NSString *)path params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure {
    [self.sessionManager GET:path parameters:params progress:nil success:success failure:failure];
}

- (void)POST:(NSString *)path params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure {
    [self.sessionManager POST:path parameters:params progress:nil success:success failure:failure];
}

@end
