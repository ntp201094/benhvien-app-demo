//
//  ChangePasswordViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/20/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "UserDataManager.h"
#import "AppDelegate.h"

@interface ChangePasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Đổi mật khẩu";
    [self setupNavigationBarItem];
}

- (void)setupNavigationBarItem {
    UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSearchPlacesScreen)];
    self.navigationItem.leftBarButtonItem = cancelBarButton;
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneSearchPlacesScreen)];
    self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelSearchPlacesScreen {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneSearchPlacesScreen {
    [self changePassword];
}

- (void)validateOldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword completion:(void (^)(NSString *message, BOOL isValid))completion {
    if (!oldPassword || oldPassword.length == 0) {
        completion(@"Bạn phải nhập mật khẩu cũ!", NO);
        return;
    }
    if (!newPassword || newPassword.length == 0) {
        completion(@"Bạn phải nhập mật khẩu mới!", NO);
        return;
    }
    if (!confirmPassword || confirmPassword.length == 0) {
        completion(@"Bạn phải nhập xác nhận mật khẩu!", NO);
        return;
    }
    if (oldPassword.length < 6) {
        completion(@"Mật khẩu phải có ít nhất 6 kí tự", false);
        return;
    }
    
    if (oldPassword.length > 10) {
        completion(@"Mật khẩu tối đa 10 kí tự", false);
        return;
    }
    
    if (newPassword.length < 6) {
        completion(@"Mật khẩu phải có ít nhất 6 kí tự", false);
        return;
    }
    
    if (newPassword.length > 10) {
        completion(@"Mật khẩu tối đa 10 kí tự", false);
        return;
    }
    
    if (confirmPassword.length < 6) {
        completion(@"Mật khẩu phải có ít nhất 6 kí tự", false);
        return;
    }
    
    if (confirmPassword.length > 10) {
        completion(@"Mật khẩu tối đa 10 kí tự", false);
        return;
    }
    
    if (![newPassword isEqualToString:confirmPassword]) {
        completion(@"Mật khẩu xác nhận không đúng", false);
        return;
    }
    
    completion(@"", YES);
}

- (void)changeUserPasswordwithOldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword {
    [self showHUD];
    [ApiRequest changePasswordWithUserId:[UserDataManager sharedClient].userId oldPassword:oldPassword newPassword:newPassword completionBlock:^(ApiResponse *response, NSError *error) {
        [self hideHUD];
        if (!error) {
            if (response.success) {
                UIAlertController *cancelConfirmingAlertController = [UIAlertController alertControllerWithTitle:@"Đổi mật khẩu" message:@"Đổi mật khẩu thành công!" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self dismissViewControllerAnimated:true completion:nil];
                }];
                
                [cancelConfirmingAlertController addAction:yesAction];
                [self presentViewController:cancelConfirmingAlertController animated:YES completion:nil];
            } else {
                [self showAlertWithTitle:@"Lỗi" message:response.message];
            }
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

- (void)changePassword {
    NSString *oldPassword = self.oldPasswordTextField.text;
    NSString *newPassword = self.passwordTextField.text;
    NSString *confirmPassword = self.confirmPasswordTextField.text;
    
    [self validateOldPassword:oldPassword newPassword:newPassword confirmPassword:confirmPassword completion:^(NSString *message, BOOL isValid) {
        if (isValid) {
            [self changeUserPasswordwithOldPassword:oldPassword newPassword:newPassword confirmPassword:confirmPassword];
        } else {
            [self showAlertWithTitle:@"Lỗi" message:message];
        }
    }];
}

@end
