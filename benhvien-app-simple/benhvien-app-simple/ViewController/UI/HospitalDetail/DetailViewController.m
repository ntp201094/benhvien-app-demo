//
//  DetailViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.title = self.hostpital.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
