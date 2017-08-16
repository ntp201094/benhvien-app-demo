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
    [self reloadHospitalInfoById:self.hostpital.hospitalId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadHospitalInfoById:(NSString *)hospitalId {
    [self showHUD];
    [ApiRequest getHospitalDetailById:hospitalId completionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            [self showAlertWithTitle:@"Thong bao" message:@"Loading..."];
        }
        [self hideHUD];
    }];
}

@end
