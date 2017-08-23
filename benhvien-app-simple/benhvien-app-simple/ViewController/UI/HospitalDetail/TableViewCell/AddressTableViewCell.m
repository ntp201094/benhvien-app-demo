//
//  AddressTableViewCell.m
//  benhvien-app-simple
//
//  Created by test on 8/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AddressTableViewCell.h"
#import "HospitalAddress.h"

@implementation AddressTableViewCell

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
    HospitalAddress *addresModel = (HospitalAddress *)model;
    _hospitalAddressLabel.text = addresModel.address;
}

@end
