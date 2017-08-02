//
//  AdvanceSearchViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AdvanceSearchViewController.h"
#import "SearchResultViewController.h"

@interface AdvanceSearchViewController ()


@end

@implementation AdvanceSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.provinceView.layer.borderWidth = 0.5f;
    self.provinceView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.provinceView.layer.cornerRadius = 5;
    self.districtView.layer.borderWidth = 0.5f;
    self.districtView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.districtView.layer.cornerRadius = 5;
    self.title = @"Tìm kiếm nâng cao";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)searchHospital:(id)sender {
    SearchResultViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    [self.navigationController showViewController:vc sender:self];
}


@end
