//
//  BaseViewController.h
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"

@protocol BaseViewControllerDelegate <NSObject>

@required
- (void)showSideMenu:(void (^)())completion;
- (void)closeSideMenu:(void (^)())completion;

@end

@interface BaseViewController : UIViewController

@property (nonatomic, assign) id<BaseViewControllerDelegate> delegate;
@property (nonatomic, assign) BOOL isMenuDisplaying;

- (void)setupMenuBarButton;
- (void)setupBackBarButtton;
- (void)showHUD;
- (void)hideHUD;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
@end
