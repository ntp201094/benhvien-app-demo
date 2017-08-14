//
//  CitySerializer.m
//  benhvien-app-simple
//
//  Created by test on 8/14/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "CitySerializer.h"

@implementation CitySerializer

- (id)initWithDataObject:(NSDictionary *)dataObject {
    self.name = [dataObject objectForKey:@"name"];
    NSArray *districtObjects = [dataObject objectForKey:@"districtes"];
    self.districtes = [districtObjects valueForKey:@"name"];
    
    return self;
}

- (NSArray *)parseArrayFromDatas:(NSArray *)datas {
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *data in datas) {
        CitySerializer *newCity = [[CitySerializer alloc] initWithDataObject:data];
        [result addObject:newCity];
    }
    
    return result;
}

@end
