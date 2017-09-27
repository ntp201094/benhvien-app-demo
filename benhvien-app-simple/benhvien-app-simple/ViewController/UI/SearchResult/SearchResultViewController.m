//
//  SearchResultViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultTableViewCell.h"
#import "Hospital.h"
#import "DetailViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface SearchResultViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.title = @"Kết quả";
    __weak SearchResultViewController *weakSelf = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        // prepend data to dataSource, insert cells at top of table view
        // call [tableView.pullToRefreshView stopAnimating] when done
        [weakSelf refreshData];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        // append data to data source, insert new cells at the end of table view
        // call [tableView.infiniteScrollingView stopAnimating] when done
        [weakSelf loadMoreData];
    }];
}

- (void)loadHospitalListWithResponse:(ApiResponse *)response loadMore:(BOOL)isLoadMore {
    NSLog(@"%@", response.originalResponse);
    NSArray *data = [response.data objectForKey:@"hospitals"];
    if (data.count > 0) {
        NSArray *hospitalSerializers = [[HospitalSerializer alloc] parseArrayFromDatas:data];
        if (isLoadMore) {
            self.hospitalList = [self.hospitalList arrayByAddingObjectsFromArray:[[Hospital alloc] parseArrayFromSerializers:hospitalSerializers]];
        } else {
            self.hospitalList = [[Hospital alloc] parseArrayFromSerializers:hospitalSerializers];
        }
        [self.tableView reloadData];
    }
}

- (void)refreshData {
    self.currentPage = 1;
    if (self.name) {
        [self refreshHospitalByName:NO];
    } else if (self.district) {
        [self refreshHospitalByProvinceAndDistrict:NO];
    } else {
        [self refreshHospitalByProvince:NO];
    }
}

- (void)loadMoreData {
    if (self.currentPage >= self.totalPages) {
        [self.tableView.infiniteScrollingView stopAnimating];
        return;
    }
    self.currentPage += 1;
    if (self.name) {
        [self refreshHospitalByName:YES];
    } else if (self.district) {
        [self refreshHospitalByProvinceAndDistrict:YES];
    } else {
        [self refreshHospitalByProvince:YES];
    }
}

- (void)refreshHospitalByName:(BOOL)loadMore {
    [ApiRequest searchHospitalByName:self.name page:self.currentPage
                     completionBlock:^(ApiResponse *response, NSError *error) {
                         if (!error) {
                             [self loadHospitalListWithResponse:response loadMore:loadMore];
                             if (loadMore) {
                                 [self.tableView.infiniteScrollingView stopAnimating];
                             } else {
                                 [self.tableView.pullToRefreshView stopAnimating];
                             }
                         } else {
                             NSLog(@"%@", [error localizedDescription]);
                         }
                     }];
}

- (void)refreshHospitalByProvince:(BOOL)loadMore {
    [ApiRequest searchHospitalByProvince:self.province page:self.currentPage completionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            [self loadHospitalListWithResponse:response loadMore:loadMore];
            if (loadMore) {
                [self.tableView.infiniteScrollingView stopAnimating];
            } else {
                [self.tableView.pullToRefreshView stopAnimating];
            }
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

- (void)refreshHospitalByProvinceAndDistrict:(BOOL)loadMore {
    [ApiRequest searchHospitalByProvince:self.province district:self.district page:self.currentPage completionBlock:^(ApiResponse *response, NSError *error) {
        if (!error) {
            [self loadHospitalListWithResponse:response loadMore:loadMore];
            if (loadMore) {
                [self.tableView.infiniteScrollingView stopAnimating];
            } else {
                [self.tableView.pullToRefreshView stopAnimating];
            }
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hospitalList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    Hospital *hospital = self.hospitalList[indexPath.row];
    [cell.resultImageView sd_setImageWithURL:[NSURL URLWithString:hospital.avatar]];
    cell.resultNameLabel.text = hospital.name;
    cell.resultCityLabel.text = hospital.city;
    cell.resultAdressLabel.text = [NSString stringWithFormat:@"Địa chỉ: %@", hospital.address];
    cell.resultPhoneLabel.text = [NSString stringWithFormat:@"Điện thoại: %@", hospital.phones];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    vc.hostpital = self.hospitalList[indexPath.row];
    [self.navigationController showViewController:vc sender:self];
}

@end
