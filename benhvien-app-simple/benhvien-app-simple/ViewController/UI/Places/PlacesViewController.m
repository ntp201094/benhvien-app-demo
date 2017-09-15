//
//  PlacesViewController.m
//  benhvien-app-simple
//
//  Created by PhucNT on 9/13/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "PlacesViewController.h"
#import <HNKGooglePlacesAutocomplete/HNKGooglePlacesAutocomplete.h>
#import "PlacesTableViewCell.h"

@interface PlacesViewController () <UITableViewDataSource, UITableViewDelegate>
{
  UITextField *_searchTextField;
  HNKGooglePlacesAutocompleteQuery *_query;
  NSArray *_searchResults;
}
@property (weak, nonatomic) IBOutlet UITableView *placesTableView;

@end

@implementation PlacesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _query = [HNKGooglePlacesAutocompleteQuery sharedQuery];
  _searchResults = [NSArray new];
  _placesTableView.dataSource = self;
  _placesTableView.delegate = self;
  _placesTableView.estimatedRowHeight = 44.0;
  
  [self setupNavigationBarItem];
  [self reloadPlacesWithText:@"A"];
}

- (void)setupNavigationBarItem {
  UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSearchPlacesScreen)];
  self.navigationItem.leftBarButtonItem = cancelBarButton;
  
  _searchTextField = [self searchBox];
  UIView *wrapperView = [[UIView alloc] initWithFrame:_searchTextField.frame];
  [wrapperView addSubview:_searchTextField];
  self.navigationItem.titleView = wrapperView;
  
  UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneSearchPlacesScreen)];
  self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelSearchPlacesScreen {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneSearchPlacesScreen {
  [self performSegueWithIdentifier:@"finishSearchingSegue" sender:self];
}

- (UITextField *)searchBox {
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  CGFloat textFieldWidth = (220.0/375.0) * screenWidth;
  UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, textFieldWidth, 35.0)];
  searchTextField.borderStyle = UITextBorderStyleNone;
  searchTextField.layer.borderWidth = 0.5;
  searchTextField.layer.cornerRadius = 4.0;
  searchTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
  searchTextField.backgroundColor = [UIColor whiteColor];
  searchTextField.font = [UIFont systemFontOfSize:15.0];
  searchTextField.placeholder = @"Tỉnh/Thành phố";
  [searchTextField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
  
  return searchTextField;
}

- (void)textFieldDidChanged:(UITextField *)textField {
  NSString *searchText = textField.text;
  [self reloadPlacesWithText:searchText];
}

- (void)reloadPlacesWithText:(NSString *)searchText {
  [_query fetchPlacesForSearchQuery:searchText
                         completion:^(NSArray *places, NSError *error)  {
                           if (error) {
                             NSLog(@"ERROR: %@", error);
                           } else {
                             _searchResults = places;
                             [_placesTableView reloadData];
                           }
                         }
   ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  PlacesTableViewCell *cell = (PlacesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PlacesTableViewCell"];
  HNKGooglePlacesAutocompletePlace *data = _searchResults[indexPath.row];
  cell.placeNameLabel.text = data.name;
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  HNKGooglePlacesAutocompletePlace *data = _searchResults[indexPath.row];
  _selectedCity = data.name;
}

@end
