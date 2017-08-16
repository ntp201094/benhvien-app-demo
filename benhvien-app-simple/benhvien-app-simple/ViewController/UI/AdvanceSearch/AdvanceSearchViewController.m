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
#import "HospitalSerializer.h"
#import "Hospital.h"

#define allDistrict         @"Tất cả Quận/Huyện"

@interface AdvanceSearchViewController () <IQDropDownTextFieldDelegate>

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
    self.provinceDropDownTextField.isOptionalDropDown = NO;
    self.districtDropDownTextField.isOptionalDropDown = NO;
    self.provinceDropDownTextField.delegate = self;
    self.title = @"Tìm kiếm nâng cao";
    [self reloadAdvancedSearchingPickerData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadDistrictDropDownTextFieldWithCity:(CitySerializer *)city {
    NSMutableArray *districtList = [NSMutableArray arrayWithArray:city.districtes];
    [districtList insertObject:allDistrict atIndex:0];
    [self.districtDropDownTextField setItemList:districtList];
}

- (void)reloadAdvancedSearchingPickerData {
    [self showHUD];
    [ApiRequest getAllCitiesWithCompletionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            NSLog(@"%@", response.originalResponse);
            NSArray *data = [response.data objectForKey:@"cities"];
            if (data.count > 0) {
                self.citySerializers = [[CitySerializer alloc] parseArrayFromDatas:data];
                
                [self.provinceDropDownTextField setItemList:[self.citySerializers valueForKey:@"name"]];
                [self reloadDistrictDropDownTextFieldWithCity:self.citySerializers[0]];
            } else {
                
            }
            [self hideHUD];
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

- (void)loadHospitalListWithResponse:(ApiResponse *)response {
    NSLog(@"%@", response.originalResponse);
    NSArray *data = [response.data objectForKey:@"hospitals"];
    if (data.count > 0) {
        NSArray *hospitalSerializers = [[HospitalSerializer alloc] parseArrayFromDatas:data];
        NSArray *hospitalList = [[Hospital alloc] parseArrayFromSerializers:hospitalSerializers];
        SearchResultViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
        vc.hospitalList = hospitalList;
        [self.navigationController showViewController:vc sender:self];
    } else {
        [self showAlertWithTitle:@"Loi khong tim thay" message:@"Khong tim thay hospital"];
    }
}

- (void)textField:(IQDropDownTextField *)textField didSelectItem:(NSString *)item {
    [self reloadDistrictDropDownTextFieldWithCity:self.citySerializers[textField.selectedRow]];
}

- (IBAction)searchHospital:(id)sender {
    [self showHUD];
    NSString *provinceName = [self.provinceDropDownTextField.selectedItem stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *districtName = [self.districtDropDownTextField.selectedItem stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([districtName isEqualToString:allDistrict]) {
        [ApiRequest searchHospitalByProvince:provinceName completionBlock:^(ApiResponse *response, NSError *error) {
            if (!error) {
                [self loadHospitalListWithResponse:response];
                [self hideHUD];
            }
        }];
    } else {
        [ApiRequest searchHospitalByProvince:provinceName district:districtName completionBlock:^(ApiResponse *response, NSError *error) {
            if (!error) {
                [self loadHospitalListWithResponse:response];
                [self hideHUD];
            }
        }];
    }
    
}


@end
