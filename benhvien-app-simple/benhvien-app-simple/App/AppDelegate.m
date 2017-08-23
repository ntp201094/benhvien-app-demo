//
//  AppDelegate.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>

#define GoogleApiKey                                        @"AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSServices provideAPIKey:GoogleApiKey];
    [GMSPlacesClient provideAPIKey:GoogleApiKey];
    
    return YES;
}


@end
