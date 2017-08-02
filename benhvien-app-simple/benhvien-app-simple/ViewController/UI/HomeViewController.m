//
//  HomeViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "HomeViewController.h"
#import "AdvanceSearchViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuBarButton];
    self.searchTextField.layer.borderWidth = 0.5f;
    self.searchTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.searchTextField.layer.cornerRadius = 4.0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToAdvanceSearch:(id)sender {
    AdvanceSearchViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AdvanceSearchViewController"];
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
