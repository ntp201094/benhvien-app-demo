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
#import "AccountViewController.h"
#import <HNKGooglePlacesAutocomplete/HNKGooglePlacesAutocomplete.h>
#import "UserDataManager.h"
#import "LoginViewController.h"

#define GoogleApiKey                                        @"AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSServices provideAPIKey:GoogleApiKey];
    [GMSPlacesClient provideAPIKey:GoogleApiKey];
    [OCDirectionsAPIClient provideAPIKey:GoogleApiKey];
    [HNKGooglePlacesAutocompleteQuery setupSharedQueryWithAPIKey:GoogleApiKey];
    
    [self setupApplicationTheme];
    if ([[UserDataManager sharedClient].accessToken isEqualToString:@""]) {
        [self setupFirstLoginScreen];
    } else {
        [self setupHomeScreen];
    }
    
    return YES;
}

- (void)setupFirstLoginScreen {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UserDataManager sharedClient] clearUserData];
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    LoginViewController *loginViewController = [loginStoryboard instantiateInitialViewController];
    BaseNavigationController *loginNavigationController = [[BaseNavigationController alloc] initWithRootViewController:loginViewController];
    [self.window setRootViewController:loginNavigationController];
    [self.window makeKeyAndVisible];
}

- (void)setupHomeScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *homeStoryBoard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    
    AccountViewController *accountController = [homeStoryBoard instantiateViewControllerWithIdentifier:@"AccountViewController"];
    BaseNavigationController *accountNavigationController = [[BaseNavigationController alloc] initWithRootViewController:accountController];
    
    HomeViewController *homeController = [homeStoryBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    BaseNavigationController *homeNavigationController = [[BaseNavigationController alloc] initWithRootViewController:homeController];
    
    AppInformationViewController *appInfoController = [homeStoryBoard instantiateViewControllerWithIdentifier:@"AppInformationViewController"];
    BaseNavigationController *appInfoNavigationController = [[BaseNavigationController alloc] initWithRootViewController:appInfoController];
    
    BaseTabBarController *tabBarController = [BaseTabBarController new];
    tabBarController.accountController = accountNavigationController.viewControllers[0];
    tabBarController.homeController = homeNavigationController.viewControllers[0];
    tabBarController.appInfoController = appInfoNavigationController.viewControllers[0];
    tabBarController.viewControllers = @[accountNavigationController, homeNavigationController, appInfoNavigationController];
    [tabBarController setupContainerViewDelegate];
    tabBarController.selectedIndex = 1; // home view
    
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
