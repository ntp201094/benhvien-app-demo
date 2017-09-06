//
//  LoginEmailViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/6/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LoginEmailViewController.h"

@interface LoginEmailViewController ()

@end

@implementation LoginEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBarItem];
}

- (void)setupNavigationBarItem {
    self.title = @"Đăng nhập";
    
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
}

- (void)displaySignUpView {
    self.title = @"Đăng ký";
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
