//
//  LoginViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/6/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginEmailViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = true;
}

- (IBAction)goToLoginEmailScreen:(id)sender {
    LoginEmailViewController *loginEmailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginEmailViewController"];
    [self.navigationController showViewController:loginEmailVC sender:self];
}

@end
