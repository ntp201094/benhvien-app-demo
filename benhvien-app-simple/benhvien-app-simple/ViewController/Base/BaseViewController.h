//
//  BaseViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"

@interface BaseViewController : UIViewController

- (void)setupMenuBarButton;
- (void)setupBackBarButtton;
- (void)showHUD;
- (void)hideHUD;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
@end
