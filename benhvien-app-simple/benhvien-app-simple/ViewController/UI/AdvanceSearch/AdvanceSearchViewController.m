//
//  AdvanceSearchViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AdvanceSearchViewController.h"
#import "SearchResultViewController.h"
#import "CitySerializer.h"

@interface AdvanceSearchViewController ()

@property (nonatomic) NSArray *citySerializers;

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
    [self reloadAdvancedSearchingPickerData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadAdvancedSearchingPickerData {
    [self showHUD];
    [ApiRequest getAllCitiesWithCompletionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            NSLog(@"%@", response.originalResponse);
            NSArray *data = [response.data objectForKey:@"cities"];
            if (data.count > 0) {
                self.citySerializers = [[CitySerializer alloc] parseArrayFromDatas:data];
                self.provinceDropDownTextField.isOptionalDropDown = NO;
                
                [self.provinceDropDownTextField setItemList:[self.citySerializers valueForKey:@"name"]];
                [self.districtDropDownTextField setItemList:[self.citySerializers[0] objectForKey:@"districts"]];
            } else {
                
            }
            [self hideHUD];
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

- (IBAction)searchHospital:(id)sender {
//    SearchResultViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
//    [self.navigationController showViewController:vc sender:self];
}


@end
