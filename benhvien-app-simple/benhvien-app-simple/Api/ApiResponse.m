//
//  ApiResponse.m
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ApiResponse.h"

@implementation ApiResponse

+ (instancetype)initWithResponse:(NSDictionary *)response {
    ApiResponse *apiResponse = [[ApiResponse alloc] init];
    apiResponse.data = [NSDictionary dictionaryWithDictionary:response];
    return apiResponse;
}

@end
