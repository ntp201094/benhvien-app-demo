//
//  SearchResultViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultViewController : BaseViewController

@property (nonatomic) NSString *province;
@property (nonatomic) NSString *district;
@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *hospitalList;
@property (nonatomic) NSInteger totalPages;
@property (nonatomic) NSInteger currentPage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
