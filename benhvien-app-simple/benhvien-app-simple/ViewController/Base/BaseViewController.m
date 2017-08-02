//
//  BaseViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupMenuBarButton {
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-menu"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = menuBarButton;
}

- (void)setupBackBarButtton {
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToPreviousView)];
    self.navigationItem.leftBarButtonItem = backBarButton;
}

- (void)backToPreviousView {
    [self.navigationController popViewControllerAnimated:true];
}

@end
