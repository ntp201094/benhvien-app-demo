//
//  PhoneTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "PhoneTableViewCell.h"
#import "HospitalPhone.h"

@implementation PhoneTableViewCell

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
    HospitalPhone *phoneModel = (HospitalPhone *)model;
    _hospitalPhoneLabel.text = phoneModel.phone;
}

@end
