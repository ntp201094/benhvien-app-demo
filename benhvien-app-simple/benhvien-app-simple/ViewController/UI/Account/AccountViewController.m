//
//  AccountViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/20/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AccountViewController.h"
#import "ChangePasswordViewController.h"
#import "BaseNavigationController.h"
#import "UserDataManager.h"

@interface AccountViewController ()

@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end

@implementation AccountViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UserDataManager *userData = [UserDataManager sharedClient];
  self.title = @"Tài khoản";
  
  self.fullNameLabel.text = userData.fullName;
  self.emailLabel.text = userData.email;
  self.cityLabel.text = userData.city;
  [self setupMenuBarButton];
}

- (IBAction)goToChangePasswordScreen:(id)sender {
  ChangePasswordViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];
  BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
  [self presentViewController:nav animated:true completion:nil];
}


#pragma mark - BaseViewControllerDelegate

- (void)showSideMenuBar {
  [self.view endEditing:NO];
  if (self.delegate) {
    if (self.isMenuDisplaying) {
      [self.delegate closeSideMenu:nil];
      self.changePasswordButton.userInteractionEnabled = YES;
    } else {
      [self.delegate showSideMenu:nil];
      self.changePasswordButton.userInteractionEnabled = NO;
    }
    self.isMenuDisplaying = !self.isMenuDisplaying;
  }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  if (self.isMenuDisplaying) {
    [self.delegate closeSideMenu:^{
      self.changePasswordButton.userInteractionEnabled = YES;
      self.isMenuDisplaying = NO;
    }];
  }
}

@end
