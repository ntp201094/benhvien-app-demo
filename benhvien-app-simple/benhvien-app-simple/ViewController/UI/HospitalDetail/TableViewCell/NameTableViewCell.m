//
//  NameTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "NameTableViewCell.h"
#import "HospitalName.h"

@implementation NameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - HLTableViewCell datasource

- (void)configureCell:(id)model {
    HospitalName *nameModel = (HospitalName *)model;
    _hospitalNameLabel.text = nameModel.name;
}

@end
