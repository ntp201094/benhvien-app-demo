//
//  HomeViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "HomeViewController.h"
#import "AdvanceSearchViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuBarButton];
    self.searchTextField.layer.borderWidth = 0.5f;
    self.searchTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.searchTextField.layer.cornerRadius = 4.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)goToAdvanceSearch:(id)sender {
    AdvanceSearchViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AdvanceSearchViewController"];
    [self.navigationController showViewController:vc sender:self];
}

@end
