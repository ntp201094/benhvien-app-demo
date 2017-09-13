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
    [[ApiManager sharedClient] requestApiWithEndpoint:Login method:POST parameters:parameters completion:completion];
}

+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{@"name": name};
    [[ApiManager sharedClient] requestApiWithEndpoint:SearchByName method:GET parameters:parameters completion:completion];
}

+ (void)getAllCitiesWithCompletionBlock:(ApiComplitionBlock)completion {
    [[ApiManager sharedClient] requestApiWithEndpoint:GetAllCities method:GET parameters:nil completion:completion];
}

+ (void)searchHospitalByProvince:(NSString *)province district:(NSString *)district completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{@"city": province,
                                 @"district": district};
    [[ApiManager sharedClient] requestApiWithEndpoint:SearchByLocation method:GET parameters:parameters completion:completion];
}

+ (void)searchHospitalByProvince:(NSString *)province completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{ @"city": province };
    [[ApiManager sharedClient] requestApiWithEndpoint:SearchByProvince method:GET parameters:parameters completion:completion];
}

+ (void)getHospitalDetailById:(NSString *)hospitalId completionBlock:(ApiComplitionBlock)completion {
    NSDictionary *parameters = @{ @"id": hospitalId };
    [[ApiManager sharedClient] requestApiWithEndpoint:GetHospitalDetail method:GET parameters:parameters completion:completion];
}

+ (void)registerUserByEmail:(NSString *)email fullname:(NSString *)fullName password:(NSString *)password city:(NSString *)city completionBlock:(ApiComplitionBlock)completion {
  NSDictionary *parameters = @{ @"email": email,
                                @"password": password,
                                @"role": @"email",
                                @"city": city,
                                @"fullName": fullName};
  [[ApiManager sharedClient] requestApiWithEndpoint:Register method:POST parameters:parameters completion:completion];
}

@end
