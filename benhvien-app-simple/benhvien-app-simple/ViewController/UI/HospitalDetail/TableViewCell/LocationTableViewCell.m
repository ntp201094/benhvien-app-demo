//
//  LocationTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LocationTableViewCell.h"
#import "HospitalLocation.h"

@implementation LocationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - HLTableViewCell datasource

- (void)configureCell:(id)model {
    HospitalLocation *locationModel = (HospitalLocation *)model;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:locationModel.latitude
                                                            longitude:locationModel.longitude
                                                                 zoom:15.0];
    _mapView.camera = camera;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(locationModel.latitude, locationModel.longitude);
    marker.title = locationModel.name;
    marker.snippet = locationModel.street;
    marker.map = _mapView;
}

@end
