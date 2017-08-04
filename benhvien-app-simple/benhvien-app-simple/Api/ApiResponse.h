//
//  ApiResponse.h
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiResponse : NSObject

@property (nonatomic) NSDictionary *data;

+ (instancetype)initWithResponse:(NSDictionary *)response;

@end
