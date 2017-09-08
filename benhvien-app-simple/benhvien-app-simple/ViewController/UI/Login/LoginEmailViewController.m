//
//  LoginEmailViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/6/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LoginEmailViewController.h"

@interface LoginEmailViewController ()

@property (weak, nonatomic) IBOutlet UIView *signInView;
@property (weak, nonatomic) IBOutlet UITextField *signInUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signInPasswordTextField;

@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (weak, nonatomic) IBOutlet UITextField *signUpFullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpCityTextField;


@end

@implementation LoginEmailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupNavigationBarItem];
}

- (void)setupNavigationBarItem {
  self.title = @"Đăng nhập";
  self.signInView.hidden = false;
  self.signUpView.hidden = true;
  
  UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelLoginScreen)];
  self.navigationItem.leftBarButtonItem = cancelBarButton;
  
  UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneLoginScreen)];
  self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelLoginScreen {
  [self dismissViewControllerAnimated:true completion:nil];
}

- (void)doneLoginScreen {
  
}

- (void)displaySignInView {
  self.title = @"Đăng nhập";
  self.signInView.hidden = false;
  self.signUpView.hidden = true;
  [self resetSignUpViewInput];
}

- (void)displaySignUpView {
  self.title = @"Đăng ký";
  self.signUpView.hidden = false;
  self.signInView.hidden = true;
  [self resetSignInViewInput];
}

- (void)resetSignInViewInput {
  [self.signInUserNameTextField endEditing:YES];
  [self.signInPasswordTextField endEditing:YES];
  self.signInUserNameTextField.text = @"";
  self.signInPasswordTextField.text = @"";
}

-(void)resetSignUpViewInput {
  [self.signUpFullNameTextField endEditing:YES];
  [self.signUpEmailTextField endEditing:YES];
  [self.signUpPasswordTextField endEditing:YES];
  [self.signUpCityTextField endEditing:YES];
  self.signUpFullNameTextField.text = @"";
  self.signUpEmailTextField.text = @"";
  self.signUpPasswordTextField.text = @"";
  self.signUpCityTextField.text = @"";
}

- (IBAction)changeSegmentTab:(UISegmentedControl *)sender {
  switch (sender.selectedSegmentIndex) {
    case 0:
      [self displaySignInView];
      break;
    case 1:
      [self displaySignUpView];
      break;
      
    default:
      break;
  }
}

@end
