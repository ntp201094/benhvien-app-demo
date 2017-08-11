//
//  HospitalSerializer.h
//  benhvien-app-simple
//
//  Created by test on 8/11/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HospitalSerializer : NSObject

@property (nonatomic) NSString *hospitalId;
@property (nonatomic) NSString *avatar;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *hospitalDescription;
@property (nonatomic) NSString *district;
@property (nonatomic) NSArray *images;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *phones;
@property (nonatomic) NSString *street;

- (id)initWithDataObject:(NSDictionary *)dataObject;
- (NSArray *)parseArrayFromDatas:(NSArray *)datas;

@end
