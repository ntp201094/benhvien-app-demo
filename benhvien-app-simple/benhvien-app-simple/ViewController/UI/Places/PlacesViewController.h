//
//  PlacesViewController.h
//  benhvien-app-simple
//
//  Created by PhucNT on 9/13/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"

@interface PlacesViewController : BaseViewController

@property (nonatomic, strong) void (^onSelectedCity)(NSString *);
@property (nonatomic, assign) NSString *selectedCity;

@end
