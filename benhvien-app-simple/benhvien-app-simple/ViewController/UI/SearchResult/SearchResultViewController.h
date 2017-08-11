//
//  SearchResultViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultViewController : BaseViewController

@property (strong, nonatomic) NSArray *hospitalList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
