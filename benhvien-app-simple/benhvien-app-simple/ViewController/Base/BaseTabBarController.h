//
//  BaseTabBarController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "AppInformationViewController.h"

@interface BaseTabBarController : UITabBarController

@property (nonatomic, strong) HomeViewController *homeController;
@property (nonatomic, strong) AppInformationViewController *appInfoController;

- (void)setupContainerViewDelegate;

@end
