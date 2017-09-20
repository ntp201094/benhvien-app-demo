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
#import "AccountViewController.h"

@interface BaseTabBarController : UITabBarController

@property (nonatomic, weak) HomeViewController *homeController;
@property (nonatomic, weak) AppInformationViewController *appInfoController;
@property (nonatomic, weak) AccountViewController *accountController;

- (void)setupContainerViewDelegate;

@end
