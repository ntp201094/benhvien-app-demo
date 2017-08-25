//
//  DetailViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "DetailViewController.h"
#import "ThumbImageTableViewCell.h"
#import "NameTableViewCell.h"
#import "AddressTableViewCell.h"
#import "PhoneTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "LocationTableViewCell.h"
#import "HospitalThumbImage.h"
#import "HospitalName.h"
#import "HospitalAddress.h"
#import "HospitalPhone.h"
#import "HospitalDescription.h"
#import "HospitalLocation.h"
#import "DirectionViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    [self setupDirectionBarButton];
    self.title = self.hostpital.name;
    [self setupTableViewLayout];
    [self reloadHospitalInfoById:self.hostpital.hospitalId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupDirectionBarButton {
    UIBarButtonItem *directionButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"direction-icon"] style:UIBarButtonItemStylePlain target:self action:@selector(goToDirectionView)];
    self.navigationItem.rightBarButtonItem = directionButton;
}

- (void)reloadHospitalInfoById:(NSString *)hospitalId {
    [self showHUD];
    [ApiRequest getHospitalDetailById:hospitalId completionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            if (response.success) {
                NSLog(@"%@", response.originalResponse);
                NSDictionary *data = [response.data objectForKey:@"hospitalInfo"];
                if (data) {
                    HospitalSerializer *serializer = [[HospitalSerializer alloc] initWithDataObject:data];
                    Hospital *hospital = [[Hospital alloc] initWithSerializer:serializer];
                    [self.tableView addItems:[self getTableViewDataByHospital:hospital]];
                    self.hostpital = hospital;
                } else {
                    [self showAlertWithTitle:@"Loi" message:@"Khong tim thay du lieu"];
                }
            } else {
                [self showAlertWithTitle:@"Loi" message:response.message];
            }
        } else {
            [self showAlertWithTitle:@"Loi" message:[error localizedDescription]];
        }
        [self hideHUD];
    }];
}

- (NSMutableArray *)getTableViewDataByHospital:(Hospital *)hospital {
    NSMutableArray *datas = [NSMutableArray new];
    HospitalThumbImage *thumbImageModel = [HospitalThumbImage new];
    thumbImageModel.images = hospital.images;
    [datas addObject:thumbImageModel];
    
    HospitalName *nameModel = [HospitalName new];
    nameModel.name = hospital.name;
    [datas addObject:nameModel];
    
    HospitalAddress *addressModel = [HospitalAddress new];
    addressModel.address = hospital.address;
    [datas addObject:addressModel];
    
    HospitalPhone *phoneModel = [HospitalPhone new];
    phoneModel.phone = hospital.phones;
    [datas addObject:phoneModel];
    
    HospitalDescription *descriptionModel = [HospitalDescription new];
    descriptionModel.hospitalDescription = hospital.hospitalDescription;
    [datas addObject:descriptionModel];
    
    HospitalLocation *locationModel = [HospitalLocation new];
    locationModel.latitude = hospital.latitude;
    locationModel.longitude = hospital.longitude;
    locationModel.name = hospital.name;
    locationModel.street = hospital.street;
    [datas addObject:locationModel];
    
    return datas;
}

- (void)setupTableViewLayout {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
    [self.tableView registerCell:[ThumbImageTableViewCell class] forModel:[HospitalThumbImage class]];
    [self.tableView registerCell:[NameTableViewCell class] forModel:[HospitalName class]];
    [self.tableView registerCell:[AddressTableViewCell class] forModel:[HospitalAddress class]];
    [self.tableView registerCell:[PhoneTableViewCell class] forModel:[HospitalPhone class]];
    [self.tableView registerCell:[DescriptionTableViewCell class] forModel:[HospitalDescription class]];
    [self.tableView registerCell:[LocationTableViewCell class] forModel:[HospitalLocation class]];
}

- (void)goToDirectionView {
    DirectionViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DirectionViewController"];
    nextViewController.hospital = self.hostpital;
    [self showViewController:nextViewController sender:self];
}

@end
