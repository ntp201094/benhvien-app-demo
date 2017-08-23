//
//  AdvanceSearchViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseViewController.h"
#import <IQDropDownTextField/IQDropDownTextField.h>

@interface AdvanceSearchViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *provinceView;
@property (weak, nonatomic) IBOutlet UIView *districtView;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *provinceDropDownTextField;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *districtDropDownTextField;
@property (weak, nonatomic) IBOutlet UIImageView *provinceCaretDownImageView;
@property (weak, nonatomic) IBOutlet UIImageView *provinceCaretUpImageView;
@property (weak, nonatomic) IBOutlet UIImageView *districtCaretDownImageView;
@property (weak, nonatomic) IBOutlet UIImageView *districtCaretUpImageView;

@end
