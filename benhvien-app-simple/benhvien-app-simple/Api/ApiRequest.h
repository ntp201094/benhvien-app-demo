//
//  ApiRequest.h
//  benhvien-app-simple
//
//  Created by test on 8/4/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiEndpoint.h"
#import "ApiManager.h"

@interface ApiRequest : NSObject

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completionBlock:(ApiComplitionBlock)completion;
+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiComplitionBlock)completion;

@end
