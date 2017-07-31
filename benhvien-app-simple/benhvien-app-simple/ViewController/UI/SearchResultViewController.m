//
//  SearchResultViewController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultTableViewCell.h"
#import "Hospital.h"
#import "DetailViewController.h"

@interface SearchResultViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *hospitalList;

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackBarButtton];
    self.title = @"Kết quả";
    self.hospitalList = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        Hospital *hospital = [Hospital new];
        hospital.name = @"Benh vien chan thuong chinh hinh";
        hospital.city = @"Ho Chi Minh";
        hospital.address = @"929 Tran Hung Dao - Phuong 1 - Quan 5 - TP. Ho Chi Minh";
        hospital.phone = @"89.39235791 - 39235821 - 39237007";
        [self.hospitalList addObject:hospital];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    Hospital *hospital = self.hospitalList[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:@"side-menu-bg"];
    cell.lblName.text = hospital.name;
    cell.lblCity.text = hospital.city;
    cell.lblAddress.text = hospital.address;
    cell.lblPhone.text = hospital.phone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    vc.hostpital = self.hospitalList[indexPath.row];
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
