//
//  DirectionViewController.m
//  benhvien-app-simple
//
//  Created by test on 8/25/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "DirectionViewController.h"
#import <OCGoogleDirectionsAPI/OCGoogleDirectionsAPI.h>

@interface DirectionViewController () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation DirectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBackBarButtton];
    self.title = self.hospital.name;
    
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization];
}

- (void)drawDirectionPathWithOriginLocation:(CLLocation *)origin destinationLocation:(CLLocation *)destination {
    OCDirectionsRequest *request = [OCDirectionsRequest requestWithOriginLocation:origin andDestinationLocation:destination];
    OCDirectionsAPIClient *client = [OCDirectionsAPIClient new];
    [client directions:request response:^(OCDirectionsResponse *response, NSError *error) {

        if (error) {
            [self showAlertWithTitle:@"Loi" message:[error localizedDescription]];
            return;
        }
        else if (response.status != OCDirectionsResponseStatusOK) {
            [self showAlertWithTitle:@"Loi" message:@"Khong the tim thay vi tri"];
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray *routesArray = response.routes;
            GMSPolyline *polyline = nil;
            if (routesArray.count > 0) {
                OCDirectionsRoute *route = [response route];
                OCDirectionsPolyline * overViewPolyline = route.overviewPolyline;
                NSString *points = overViewPolyline.points;
                GMSPath *path = [GMSPath pathFromEncodedPath:points];
                polyline = [GMSPolyline polylineWithPath:path];
                [polyline setStrokeWidth:5.0];
            }
            if (polyline) {
                polyline.map = _mapView;
            }
        });
        
    }];
}

// MARK: CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        [_locationManager startUpdatingLocation];
        
        self.mapView.myLocationEnabled = true;
        self.mapView.settings.myLocationButton = true;
        self.mapView.settings.compassButton = true;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.firstObject;
    
//    _mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate zoom:15.0];
    _mapView.camera = [GMSCameraPosition cameraWithLatitude:_hospital.latitude longitude:_hospital.longitude zoom:15.0];
    
    [_locationManager stopUpdatingLocation];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(_hospital.latitude, _hospital.longitude);
    marker.title = _hospital.name;
    marker.snippet = _hospital.street;
    marker.map = _mapView;
    [self drawDirectionPathWithOriginLocation:location destinationLocation:[[CLLocation alloc] initWithLatitude:_hospital.latitude longitude:_hospital.longitude]];
}

@end
