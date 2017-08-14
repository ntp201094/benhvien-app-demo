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

@interface SearchResultViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.title = @"Kết quả";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
