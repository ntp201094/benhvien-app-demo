//
//  BaseTabBarController.m
//  benhvien-app-simple
//
//  Created by test on 7/28/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "BaseTabBarController.h"
#import "SideMenuViewController.h"
#import "BaseNavigationController.h"
#import "AppInformationViewController.h"
#import "AppDelegate.h"
#import "UIAlertController+Blocks.h"

#define CORNER_RADIUS 4
#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface BaseTabBarController () <BaseViewControllerDelegate>

@property (nonatomic) SideMenuViewController *sideMenuViewController;
@property (nonatomic, weak) UIWindow *window;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = true;
}

#pragma mark - Setup

- (void)setupContainerViewDelegate {
    self.homeController.delegate = self;
    self.appInfoController.delegate = self;
    self.accountController.delegate = self;
}

// MARK: Private methods

- (UIView *)getSideMenuView {
    if (self.sideMenuViewController == nil) {
        self.sideMenuViewController = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
        self.sideMenuViewController.delegate = self;
        self.window = [[[UIApplication sharedApplication] delegate] window];
        [self.window addSubview:self.sideMenuViewController.view];
    }
    
    UIView *view = self.sideMenuViewController.view;
    return view;
}

- (void)resetContainerView {
    if (self.sideMenuViewController != nil) {
        [self.sideMenuViewController.view removeFromSuperview];
        self.sideMenuViewController = nil;
    }
}

#pragma mark - BaseViewControllerDelegate methods

- (void)showSideMenu:(void (^)())completion {
    UIView *childView = [self getSideMenuView];
    [self.window sendSubviewToBack:childView];
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)closeSideMenu:(void (^)())completion {
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            [self resetContainerView];
            if (completion) {
                completion();
            }
        }
    }];
}

- (void)resetInputSettingsAfterCloseMenu {
    self.accountController.isMenuDisplaying = NO;
    self.accountController.changePasswordButton.userInteractionEnabled = YES;
    self.homeController.isMenuDisplaying = NO;
    self.homeController.searchTextField.userInteractionEnabled = YES;
    self.homeController.advancedSearchButton.userInteractionEnabled = YES;
    self.appInfoController.isMenuDisplaying = NO;
}

- (void)moveToTabWithIndex:(NSInteger)index completion:(void (^)())completion {
    [self closeSideMenu:nil];
    [self resetInputSettingsAfterCloseMenu];
    self.selectedIndex = index;
    if (completion) {
        completion();
    }
}

- (void)logout {
    [self closeSideMenu:nil];
    [self resetInputSettingsAfterCloseMenu];
    [UIAlertController showAlertInViewController:self withTitle:@"Đăng xuất" message:@"Bạn có chắc chắn muốn đăng xuất?" cancelButtonTitle:@"No" destructiveButtonTitle:@"Yes" otherButtonTitles:nil tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [app setupFirstLoginScreen];
        }
    }];
    
}

@end
