//
//  CitySerializer.h
//  benhvien-app-simple
//
//  Created by test on 8/14/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitySerializer : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *districtes;


- (id)initWithDataObject:(NSDictionary *)dataObject;
-  (NSArray *)parseArrayFromDatas:(NSArray *)datas;

@end
