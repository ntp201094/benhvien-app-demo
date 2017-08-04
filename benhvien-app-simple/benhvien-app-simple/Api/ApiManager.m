//
//  ApiManager.m
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ApiManager.h"
#import "ApiEndpoint.h"

@interface ApiManager()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation ApiManager
+ (instancetype)sharedClient {
    static ApiManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ApiManager alloc] init];
        [_sharedClient setupManager];
    });
    return _sharedClient;
}

- (void)setupManager {
    self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
}

- (void)requestApiWithEndpoint:(NSString *)endpoint method:(ApiMethod)method parameters:(NSDictionary *)parameters completion:(ApiComplitionBlock)completion {
    NSString *fullURL = [NSString stringWithFormat:@"%@%@", BaseURL, endpoint];
    switch (method) {
        case GET: {
            [self processGetRequestWithURL:fullURL parameters:parameters completion:completion];
            break;
        }
        case POST: {
            [self processPostRequestWithURL:fullURL parameters:parameters completion:completion];
            break;
        }
        case PUT: {
            [self processPutRequestWithURL:fullURL parameters:parameters completion:completion];
            break;
        }
        default:
            break;
    }
}

#pragma mark - GET

- (void)processGetRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiComplitionBlock)completion {
    [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processSuccessWithResponse:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processFailureWithError:error completion:completion];
    }];
}

#pragma mark - POST

- (void)processPostRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiComplitionBlock)completion {
    [self.manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processSuccessWithResponse:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processFailureWithError:error completion:completion];
    }];
}

#pragma mark - PUT

- (void)processPutRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiComplitionBlock)completion {
    [self.manager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processSuccessWithResponse:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processFailureWithError:error completion:completion];
    }];
}

#pragma mark - SUCCESS

- (void)processSuccessWithResponse:(id)responseObject completion:(ApiComplitionBlock)completion {
    ApiResponse *response = [ApiResponse initWithResponse:responseObject];
    if (completion) {
        completion(response, nil);
    }
}

#pragma mark - FAILURE

- (void)processFailureWithError:(NSError *)error completion:(ApiComplitionBlock)completion {
    if (completion) {
        completion(nil, error);
    }
}
@end
