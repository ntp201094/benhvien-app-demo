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

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.title = self.hostpital.name;
    [self setupTableViewLayout];
    [self reloadHospitalInfoById:self.hostpital.hospitalId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadHospitalInfoById:(NSString *)hospitalId {
    [self showHUD];
    [ApiRequest getHospitalDetailById:hospitalId completionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            if (response.success) {
                HospitalSerializer *serializer = [[HospitalSerializer alloc] initWithDataObject:response.data];
                Hospital *hospital = [[Hospital alloc] initWithSerializer:serializer];
                [self.tableView addItems:[self getTableViewDataByHospital:hospital]];
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
    HospitalThumbImage *thumbImage = [HospitalThumbImage new];
    [datas addObject:thumbImage];
    HospitalName *name = [HospitalName new];
    [datas addObject:name];
    HospitalAddress *address = [HospitalAddress new];
    [datas addObject:address];
    HospitalPhone *phone = [HospitalPhone new];
    [datas addObject:phone];
    HospitalDescription *description = [HospitalDescription new];
    [datas addObject:description];
    HospitalLocation *location = [HospitalLocation new];
    [datas addObject:location];
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

@end
