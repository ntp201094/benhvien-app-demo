//
//  ApiManager.h
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ApiResponse.h"

typedef enum{
    GET,
    POST,
    PUT
}ApiMethod;

typedef void (^ApiComplitionBlock)(ApiResponse *response, NSError *error);

@interface ApiManager : NSObject

+ (instancetype)sharedClient;

- (void)requestApiWithEndpoint:(NSString *)endpoint method:(ApiMethod)method parameters:(NSDictionary *)parameters completion:(ApiComplitionBlock)completion;

@end
