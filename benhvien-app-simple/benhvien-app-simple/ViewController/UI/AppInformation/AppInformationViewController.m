//
//  AppInformationViewController.m
//  benhvien-app-simple
//
//  Created by test on 8/30/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AppInformationViewController.h"

@interface AppInformationViewController ()

@end

@implementation AppInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.title = @"Thông tin";
  [self setupMenuBarButton];
}

- (void)showSideMenuBar {
  if (self.delegate) {
    if (self.isMenuDisplaying) {
      [self.delegate closeSideMenu:nil];
    } else {
      [self.delegate showSideMenu:nil];
    }
    self.isMenuDisplaying = !self.isMenuDisplaying;
  }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  if (self.isMenuDisplaying) {
    [self.delegate closeSideMenu:^{
      self.isMenuDisplaying = NO;
    }];
  }
}

@end
