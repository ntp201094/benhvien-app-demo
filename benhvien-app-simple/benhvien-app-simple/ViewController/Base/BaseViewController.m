//
//  BaseViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIAlertController+Blocks.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init {
  self.isMenuDisplaying = false;
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupMenuBarButton {
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-menu"] style:UIBarButtonItemStylePlain target:self action:@selector(showSideMenuBar)];
    self.navigationItem.leftBarButtonItem = menuBarButton;
}

- (void)setupBackBarButtton {
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToPreviousView)];
    self.navigationItem.leftBarButtonItem = backBarButton;
}

- (void)backToPreviousView {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)showHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:true];
    });
}

- (void)hideHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:true];
    });
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [UIAlertController showAlertInViewController:self
                                       withTitle:title
                                         message:message
                               cancelButtonTitle:@"OK"
                          destructiveButtonTitle:nil
                               otherButtonTitles:nil
                                        tapBlock:nil];
}

- (void)showSideMenuBar {
  
}

@end
