//
//  ChangePasswordViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/20/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Đổi mật khẩu";
  [self setupNavigationBarItem];
}

- (void)setupNavigationBarItem {
  UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSearchPlacesScreen)];
  self.navigationItem.leftBarButtonItem = cancelBarButton;
  
  UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneSearchPlacesScreen)];
  self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelSearchPlacesScreen {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneSearchPlacesScreen {
  
}

- (void)validateEmail:(NSString *)email password:(NSString *)password completion:(void (^)(NSString *message, BOOL isValid))completion {
  if (!email || email.length == 0) {
    completion(@"Bạn phải nhập email!", NO);
    return;
  }
  if (!password || password.length == 0) {
    completion(@"Bạn phải nhập password!", NO);
    return;
  }
  if (password.length < 6) {
    completion(@"Mật khẩu phải có ít nhất 6 kí tự", false);
    return;
  }
  
  if (password.length > 10) {
    completion(@"Mật khẩu tối đa 10 kí tự", false);
    return;
  }
  
  completion(@"", YES);
}

@end
