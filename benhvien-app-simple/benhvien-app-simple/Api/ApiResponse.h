//
//  ApiResponse.h
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiResponse : NSObject

@property (nonatomic) id data;
@property (nonatomic) NSDictionary *originalResponse;
@property (nonatomic) bool success;
@property (nonatomic) NSString *message;

+ (instancetype)initWithResponse:(NSDictionary *)response;

@end
