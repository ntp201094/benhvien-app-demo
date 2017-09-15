//
//  SideMenuViewController.m
//  benhvien-app-simple
//
//  Created by PhucNT on 8/29/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MenuItemTableViewCell.h"

#define cellIdentifier  @"itemCell"

typedef enum : NSUInteger {
  SearchIndex = 0,
  InformationIndex = 1,
  Logout = 2
} MenuItemIndex;

@interface SideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView setTableFooterView:[UIView new]];
  self.tableView.scrollEnabled = NO;
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MenuItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  switch (indexPath.row) {
    case SearchIndex:{
      cell.itemIconImageView.image = [UIImage imageNamed:@"search-menu-icon"];
      cell.itemNameLabel.text = @"Tìm kiếm";
      break;
    }
    case InformationIndex:{
      cell.itemIconImageView.image = [UIImage imageNamed:@"information-menu-icon"];
      cell.itemNameLabel.text = @"Thông tin";
      break;
    }
    case Logout:{
      cell.itemIconImageView.image = [UIImage imageNamed:@"logout-icon"];
      cell.itemNameLabel.text = @"Đăng xuất";
      break;
    }
    default:
      break;
  }
  
  return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.delegate) {
    if (indexPath.row == Logout) {
      [self.delegate logout];
      return;
    }
    [self.delegate moveToTabWithIndex:indexPath.row completion:nil];
  }
}


@end
