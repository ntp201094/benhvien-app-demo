//
//  ContainerViewController.m
//  benhvien-app-simple
//
//  Created by PhucNT on 8/29/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ContainerViewController.h"
#import "SideMenuViewController.h"
#import "BaseNavigationController.h"
#import "AppInformationViewController.h"

#define CORNER_RADIUS 4
#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface ContainerViewController () <BaseViewControllerDelegate>

@property (nonatomic, strong) BaseNavigationController *searchViewNavigationController;
@property (nonatomic, strong) SideMenuViewController *sideMenuViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  [self setupView];
}

- (void)setupView {
  
  self.searchViewNavigationController = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
  BaseViewController *baseViewController = (BaseViewController *)self.searchViewNavigationController.viewControllers[0];
  baseViewController.delegate = self;
  [self addChildViewController:self.searchViewNavigationController];
  [self.view addSubview:self.searchViewNavigationController.view];
  [self.searchViewNavigationController didMoveToParentViewController:self];
}

- (void)showSideMenu:(void (^)())completion {
  UIView *childView = [self getSideMenuView];
  [self.view sendSubviewToBack:childView];
  [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
    self.searchViewNavigationController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
  } completion:^(BOOL finished) {
    completion();
  }];
}

- (void)closeSideMenu:(void (^)())completion {
  [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
    self.searchViewNavigationController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
  } completion:^(BOOL finished) {
    if (finished) {
      [self resetContainerView];
      completion();
    }
  }];
}

- (UIView *)getSideMenuView {
  if (self.sideMenuViewController == nil) {
    self.sideMenuViewController = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
      self.sideMenuViewController.delegate = self;
    [self addChildViewController:self.sideMenuViewController];
    [self.view addSubview:self.sideMenuViewController.view];
    [self.sideMenuViewController didMoveToParentViewController:self];
    
    self.sideMenuViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
  }
  
  UIView *view = self.sideMenuViewController.view;
  return view;
}

- (void)resetContainerView {
  if (self.sideMenuViewController != nil) {
    [self.sideMenuViewController.view removeFromSuperview];
    self.sideMenuViewController = nil;
  }
}

@end
