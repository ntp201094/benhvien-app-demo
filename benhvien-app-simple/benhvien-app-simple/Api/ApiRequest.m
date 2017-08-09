//
//  ApiRequest.m
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{@"email": email,
                                 @"password": password
                                 };
    [[ApiManager sharedClient] requestApiWithEndpoint:LOGIN method:POST parameters:parameters completion:completion];
}

+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{@"name": name};
    [[ApiManager sharedClient] requestApiWithEndpoint:SearchByName method:GET parameters:parameters completion:completion];
}

@end
