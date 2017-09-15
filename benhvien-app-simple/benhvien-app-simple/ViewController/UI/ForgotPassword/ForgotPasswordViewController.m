//
//  ForgotPasswordViewController.m
//  benhvien-app-simple
//
//  Created by PhucNT on 9/15/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@property (weak, nonatomic) IBOutlet UIView *forgotEmailView;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Quên mật khẩu";
  [self setupNavigationBarItem];
  self.forgotEmailView.layer.borderWidth = 0.5f;
  self.forgotEmailView.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)setupNavigationBarItem {
  UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelForgotPassword)];
  self.navigationItem.leftBarButtonItem = cancelBarButton;
  
  UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(confirmForgotPassword)];
  self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelForgotPassword {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmForgotPassword {
  
}

@end
