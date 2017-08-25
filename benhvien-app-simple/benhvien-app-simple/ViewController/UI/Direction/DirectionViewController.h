//
//  DirectionViewController.h
//  benhvien-app-simple
//
//  Created by test on 8/25/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"
#import "Hospital.h"
#import <GoogleMaps/GoogleMaps.h>

@interface DirectionViewController : BaseViewController

@property (strong, nonatomic) Hospital *hospital;
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end
