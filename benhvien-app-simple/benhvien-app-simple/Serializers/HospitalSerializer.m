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
    self.hospitalId = [dataObject objectForKey:@"_id"];
    self.avatar = [dataObject objectForKey:@"avatar"];
    self.city = [dataObject objectForKey:@"city"];
    self.hospitalDescription = [dataObject objectForKey:@"description"];
    self.district = [dataObject objectForKey:@"district"];
    self.images = [dataObject objectForKey:@"images"];
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
