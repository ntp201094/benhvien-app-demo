//
//  HomeViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "HomeViewController.h"
#import "AdvanceSearchViewController.h"
#import "ApiRequest.h"
#import "SearchResultViewController.h"
#import "HospitalSerializer.h"
#import "Hospital.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuBarButton];
    self.searchTextField.layer.borderWidth = 0.5f;
    self.searchTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.searchTextField.layer.cornerRadius = 4.0;
    self.searchTextField.backgroundColor = [UIColor whiteColor];
}

- (void)validateHospitalName:(NSString *)hospitalName completion:(void (^)(BOOL isValidate, NSString *message))completion {
    if(!hospitalName || hospitalName.length == 0) {
        completion(NO, @"Ban phai nhap ten benh vien");
    } else {
        completion(YES, @"");
    }
}

- (IBAction)goToAdvanceSearch:(id)sender {
    AdvanceSearchViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AdvanceSearchViewController"];
    
    [self.navigationController showViewController:vc sender:self];
    
}
- (IBAction)finishHospitalSearching:(id)sender {
    
    [self showHUD];
    [self validateHospitalName:self.searchTextField.text completion:^(BOOL isValidate, NSString *message) {
        if(isValidate) {
            [ApiRequest searchHospitalByName:self.searchTextField.text
                             completionBlock:^(ApiResponse *response, NSError *error) {
                                 if (!error) {
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
                                 } else {
                                     NSLog(@"%@", [error localizedDescription]);
                                 }
                             }];
        } else {
            [self showAlertWithTitle:@"Loi tim kiem" message:message];
        }
      [self hideHUD];
    }];
}

- (void)showSideMenuBar {
    if (self.delegate) {
        if (self.isMenuDisplaying) {
            [self.delegate closeSideMenu:^{
                self.searchTextField.userInteractionEnabled = YES;
                self.advancedSearchButton.userInteractionEnabled = YES;
            }];
        } else {
            [self.delegate showSideMenu:^{
                self.searchTextField.userInteractionEnabled = NO;
                self.advancedSearchButton.userInteractionEnabled = NO;
            }];
        }
        self.isMenuDisplaying = !self.isMenuDisplaying;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isMenuDisplaying) {
        [self.delegate closeSideMenu:^{
            self.searchTextField.userInteractionEnabled = YES;
            self.advancedSearchButton.userInteractionEnabled = YES;
            self.isMenuDisplaying = NO;
        }];
    }
}

@end
