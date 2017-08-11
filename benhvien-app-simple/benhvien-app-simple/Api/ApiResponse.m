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
    [apiResponse parseResponse:response];
    return apiResponse;
}

- (void)parseResponse:(NSDictionary *)response {
    NSString *message = [response objectForKey:@"message"];
    if ([message isKindOfClass:[NSNull class]]) {
        self.message = @"";
    } else {
        self.message = message;
    }
    
    NSNumber *success = [response objectForKey:@"success"];
    if (success) {
        self.success = [success boolValue];
    }
    
    self.data = [response objectForKey:@"data"];
    self.originalResponse = response;
}

@end
