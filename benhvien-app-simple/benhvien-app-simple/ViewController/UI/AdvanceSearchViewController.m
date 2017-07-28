//
//  AdvanceSearchViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "AdvanceSearchViewController.h"
#import "SearchResultViewController.h"

@interface AdvanceSearchViewController ()
@property (weak, nonatomic) IBOutlet UIView *provinceView;
@property (weak, nonatomic) IBOutlet UIView *districtView;

@end

@implementation AdvanceSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.provinceView.layer.borderWidth = 0.5f;
    self.provinceView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.provinceView.layer.cornerRadius = 5;
    self.districtView.layer.borderWidth = 0.5f;
    self.districtView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.districtView.layer.cornerRadius = 5;
    self.title = @"Tìm kiếm nâng cao";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)finishSearch:(id)sender {
    SearchResultViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    [self.navigationController showViewController:vc sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
