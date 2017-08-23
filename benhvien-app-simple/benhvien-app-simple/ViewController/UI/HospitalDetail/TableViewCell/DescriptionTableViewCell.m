//
//  DescriptionTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "DescriptionTableViewCell.h"
#import "HospitalDescription.h"

@implementation DescriptionTableViewCell

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
    HospitalDescription *descriptionModel = (HospitalDescription *)model;
    _hospitalDescriptionLabel.text = descriptionModel.hospitalDescription;
}

@end
