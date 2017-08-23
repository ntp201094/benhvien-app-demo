//
//  LocationTableViewCell.h
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLTableViewCell.h"
#import <GoogleMaps/GoogleMaps.h>

@interface LocationTableViewCell : HLTableViewCell

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end
