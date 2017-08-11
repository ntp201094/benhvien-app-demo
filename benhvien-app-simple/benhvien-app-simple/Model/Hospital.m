//
//  Hospital.m
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "Hospital.h"

@implementation Hospital

- (id)initWithSerializer:(HospitalSerializer *)hospitalSerializer {
    self.hospitalId = hospitalSerializer.hospitalId;
    self.avatar = hospitalSerializer.avatar;
    self.name = hospitalSerializer.name;
    self.city = hospitalSerializer.city;
    self.address = hospitalSerializer.street;
    self.phones = [NSString new];
    for (NSString *phone in hospitalSerializer.phones) {
        [self.phones stringByAppendingString:phone];
    }
    self.hospitalDescription = hospitalSerializer.hospitalDescription;
    self.images = hospitalSerializer.images;
    return self;
}

- (NSMutableArray *)parseArrayFromSerializers:(NSArray *)serializers {
    NSMutableArray *result = [NSMutableArray new];
    for (HospitalSerializer *serializer in serializers) {
        Hospital *newHospital = [[Hospital alloc] initWithSerializer:serializer];
        [result addObject:newHospital];
    }
    
    return result;
}

@end
