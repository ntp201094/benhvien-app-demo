//
//  SideMenuViewController.m
//  benhvien-app-simple
//
//  Created by PhucNT on 8/29/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MenuItemTableViewCell.h"
#import "UserDataManager.h"

#define cellIdentifier  @"itemCell"

typedef enum : NSUInteger {
  AccountIndex = 0,
  SearchIndex = 1,
  InformationIndex = 2,
  Logout = 3
} MenuItemIndex;

@interface SideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.userNameLabel.text = [UserDataManager sharedClient].fullName;
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView setTableFooterView:[UIView new]];
  self.tableView.scrollEnabled = NO;
}

- (IBAction)goToAccountScreen:(id)sender {
  if (self.delegate) {
    [self.delegate moveToTabWithIndex:AccountIndex completion:nil];
  }
}


#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MenuItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  NSUInteger itemIndex = indexPath.row + 1;
  
  switch (itemIndex) {
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
    NSUInteger itemIndex = indexPath.row + 1;
    if (itemIndex == Logout) {
      [self.delegate logout];
      return;
    }
    [self.delegate moveToTabWithIndex:itemIndex completion:nil];
  }
}


@end
