//
//  Hospital.h
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HospitalSerializer.h"

@interface Hospital : NSObject
@property (nonatomic) NSString *hospitalId;
@property (nonatomic) NSString *avatar;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *phones;
@property (nonatomic) NSString *hospitalDescription;
@property (nonatomic) NSArray *images;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSString *street;

- (id)initWithSerializer:(HospitalSerializer *)hospitalSerializer;
- (NSMutableArray *)parseArrayFromSerializers:(NSArray *)serializers;
@end
