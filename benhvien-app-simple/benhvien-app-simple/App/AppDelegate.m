//
//  AppDelegate.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Hex.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>
#import <OCGoogleDirectionsAPI/OCGoogleDirectionsAPI.h>
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "AppInformationViewController.h"
#import "HomeViewController.h"

#define GoogleApiKey                                        @"AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSServices provideAPIKey:GoogleApiKey];
    [GMSPlacesClient provideAPIKey:GoogleApiKey];
    [OCDirectionsAPIClient provideAPIKey:GoogleApiKey];
  
  [self setupApplicationTheme];
//  [self setupHomeScreen];
  
    return YES;
}

- (void)setupHomeScreen {
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIStoryboard *homeStoryBoard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
  
  HomeViewController *homeController = [homeStoryBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
  BaseNavigationController *homeNavigationController = [[BaseNavigationController alloc] initWithRootViewController:homeController];
  
  AppInformationViewController *appInfoController = [homeStoryBoard instantiateViewControllerWithIdentifier:@"AppInformationViewController"];
  BaseNavigationController *appInfoNavigationController = [[BaseNavigationController alloc] initWithRootViewController:appInfoController];
  
  BaseTabBarController *tabBarController = [BaseTabBarController new];
  tabBarController.homeController = homeNavigationController.viewControllers[0];
  tabBarController.appInfoController = appInfoNavigationController.viewControllers[0];
  tabBarController.viewControllers = @[homeNavigationController, appInfoNavigationController];
  [tabBarController setupContainerViewDelegate];
  
  [self.window setRootViewController:tabBarController];
  [self.window makeKeyAndVisible];
}

- (void)setupApplicationTheme {
  [UINavigationBar appearance].barTintColor = [UIColor colorWithHex:0xd2232a];
  [UINavigationBar appearance].tintColor = [UIColor whiteColor];
  
  NSDictionary *titleAttribute = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
  [UINavigationBar appearance].titleTextAttributes = titleAttribute;
}


@end
