//
//  DetailViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"
#import "Hospital.h"
#import "HLTableView.h"

@interface DetailViewController : BaseViewController

@property (strong, nonatomic) Hospital *hostpital;
@property (weak, nonatomic) IBOutlet HLTableView *tableView;


@end
