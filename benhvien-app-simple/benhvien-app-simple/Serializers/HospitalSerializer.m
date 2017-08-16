//
//  HospitalSerializer.m
//  benhvien-app-simple
//
//  Created by test on 8/11/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "HospitalSerializer.h"

@implementation HospitalSerializer

- (id)initWithDataObject:(NSDictionary *)dataObject {
    NSString *hospitalId = [dataObject objectForKey:@"_id"];
    if (hospitalId && ![hospitalId isKindOfClass:[NSNull class]]) {
        self.hospitalId = hospitalId;
    }
    
    NSString *avatar = [dataObject objectForKey:@"avatar"];
    if (avatar && ![avatar isKindOfClass:[NSNull class]]) {
        self.avatar = avatar;
    }
    
    NSString *city = [dataObject objectForKey:@"city"];
    if (city && ![city isKindOfClass:[NSNull class]]) {
        self.city = city;
    }
    
    NSString *hospitalDescription = [dataObject objectForKey:@"description"];
    if (hospitalDescription && ![hospitalDescription isKindOfClass:[NSNull class]]) {
        self.hospitalDescription = hospitalDescription;
    }
    
    NSString *district = [dataObject objectForKey:@"district"];
    if (district && ![district isKindOfClass:[NSNull class]]) {
        self.district = district;
    }
    
    NSArray *images = [dataObject objectForKey:@"images"];
    if (images && ![images isKindOfClass:[NSNull class]]) {
        self.images = images;
    }
    
    self.latitude = [[dataObject objectForKey:@"latitude"] doubleValue];
    self.longitude = [[dataObject objectForKey:@"longitude"] doubleValue];
    self.name = [dataObject objectForKey:@"name"];
    self.phones = [dataObject objectForKey:@"phones"];
    self.street = [dataObject objectForKey:@"street"];
    return self;
}

- (NSArray *)parseArrayFromDatas:(NSArray *)datas {
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *data in datas) {
        HospitalSerializer *newHospital = [[HospitalSerializer alloc] initWithDataObject:data];
        [result addObject:newHospital];
    }
    
    return result;
}

@end
