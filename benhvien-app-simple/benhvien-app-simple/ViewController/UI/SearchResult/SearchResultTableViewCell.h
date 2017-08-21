//
//  SearchResultTableViewCell.h
//  benhvien-app-simple
//
//  Created by test on 7/31/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (weak, nonatomic) IBOutlet UILabel *resultNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultAdressLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultPhoneLabel;

@end
