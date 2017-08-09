//
//  BaseViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)setupMenuBarButton;
- (void)setupBackBarButtton;
- (void)showHUD;
- (void)hideHUD;
- (void)showMessage:(NSString *)message;
@end
