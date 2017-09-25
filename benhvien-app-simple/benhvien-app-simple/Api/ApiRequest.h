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
+ (void)searchHospitalByName:(NSString *)name page:(NSInteger)page completionBlock:(ApiComplitionBlock)completion;
+ (void)getAllCitiesWithCompletionBlock:(ApiComplitionBlock)completion;
+ (void)searchHospitalByProvince:(NSString *)province district:(NSString *)district page:(NSInteger)page completionBlock:(ApiComplitionBlock)completion;
+ (void)searchHospitalByProvince:(NSString *)province page:(NSInteger)page completionBlock:(ApiComplitionBlock)completion;
+ (void)getHospitalDetailById:(NSString *)hospitalId completionBlock:(ApiComplitionBlock)completion;
+ (void)registerUserByEmail:(NSString *)email fullname:(NSString *)fullName password:(NSString *)password city:(NSString *)city completionBlock:(ApiComplitionBlock)completion;
+ (void)changePasswordWithUserId:(NSString *)userId oldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword completionBlock:(ApiComplitionBlock)completion;

@end
