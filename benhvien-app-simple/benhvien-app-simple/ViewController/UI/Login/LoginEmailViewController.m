//
//  LoginEmailViewController.m
//  benhvien-app-simple
//
//  Created by test on 9/6/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LoginEmailViewController.h"
#import "UIAlertController+Blocks.h"
#import "AppDelegate.h"

typedef enum : NSUInteger {
  LOGIN = 0,
  REGISTER
} Screen;

@interface LoginEmailViewController ()

@property (weak, nonatomic) IBOutlet UIView *signInView;
@property (weak, nonatomic) IBOutlet UITextField *signInUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signInPasswordTextField;

@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (weak, nonatomic) IBOutlet UITextField *signUpFullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpCityTextField;

@property (nonatomic, assign) Screen currentScreen;


@end

@implementation LoginEmailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupNavigationBarItem];
  self.currentScreen = LOGIN;
}

- (void)setupNavigationBarItem {
  self.title = @"Đăng nhập";
  self.signInView.hidden = false;
  self.signUpView.hidden = true;
  
  UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Hủy bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelLoginScreen)];
  self.navigationItem.leftBarButtonItem = cancelBarButton;
  
  UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneLoginScreen)];
  self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)cancelLoginScreen {
//  UIAlertController *cancelConfirmingAlertController = [UIAlertController alertControllerWithTitle:@"Xác nhận" message:@"Bạn có chắc chắn muốn hủy bỏ?" preferredStyle:UIAlertControllerStyleAlert];
//  UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//    [self dismissViewControllerAnimated:YES completion:nil];
//  }];
//  UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
//  
//  [cancelConfirmingAlertController addAction:yesAction];
//  [cancelConfirmingAlertController addAction:noAction];
//  [self presentViewController:cancelConfirmingAlertController animated:YES completion:nil];
  
  [UIAlertController showAlertInViewController:self withTitle:@"Xác nhận" message:@"Bạn có chắc chắn muốn hủy bỏ?" cancelButtonTitle:@"No" destructiveButtonTitle:@"Yes" otherButtonTitles:nil tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
    if (buttonIndex == 1) {
      [self dismissViewControllerAnimated:YES completion:nil];
    }
  }];
}

- (void)doneLoginScreen {
  [self.view endEditing:YES];
  switch (self.currentScreen) {
    case LOGIN:{
      [self loginUser];
      break;
    }
    case REGISTER:{
      
      break;
    }
      
    default:
      break;
  }
}

- (void)loginUser {
  NSString *email = self.signInUserNameTextField.text;
  NSString *password = self.signInPasswordTextField.text;
  [self validateEmail:email password:password completion:^(NSString *message, BOOL isValid) {
    if (isValid) {
      [self loginWithEmail:email password:password];
    } else {
      [self showAlertWithTitle:@"Lỗi" message:message];
    }
  }];
}

- (void)registerUser {
  
}

- (void)validateEmail:(NSString *)email password:(NSString *)password completion:(void (^)(NSString *message, BOOL isValid))completion {
  if (!email || email.length == 0) {
    completion(@"Bạn phải nhập email!", NO);
    return;
  }
  if (!password || password.length == 0) {
    completion(@"Bạn phải nhập password!", NO);
    return;
  }
  completion(@"", YES);
}

- (void)loginWithEmail:(NSString *)email password:(NSString *)password {
  [self showHUD];
  [ApiRequest loginWithEmail:email password:password completionBlock:^(ApiResponse *response, NSError *error) {
    [self hideHUD];
    if (!error) {
      if (response.success) {
        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [app setupHomeScreen];
      } else {
        [self showAlertWithTitle:@"Lỗi" message:response.message];
      }
    } else {
      NSLog(@"%@", [error localizedDescription]);
    }
  }];
}

- (void)displaySignInView {
  self.title = @"Đăng nhập";
  self.signInView.hidden = false;
  self.signUpView.hidden = true;
  [self resetSignUpViewInput];
}

- (void)displaySignUpView {
  self.title = @"Đăng ký";
  self.signUpView.hidden = false;
  self.signInView.hidden = true;
  [self resetSignInViewInput];
}

- (void)resetSignInViewInput {
  [self.signInUserNameTextField endEditing:YES];
  [self.signInPasswordTextField endEditing:YES];
  self.signInUserNameTextField.text = @"";
  self.signInPasswordTextField.text = @"";
}

-(void)resetSignUpViewInput {
  [self.view endEditing:YES];
  self.signUpFullNameTextField.text = @"";
  self.signUpEmailTextField.text = @"";
  self.signUpPasswordTextField.text = @"";
  self.signUpCityTextField.text = @"";
}

- (IBAction)changeSegmentTab:(UISegmentedControl *)sender {
  switch (sender.selectedSegmentIndex) {
    case LOGIN:
      [self displaySignInView];
      break;
    case REGISTER:
      [self displaySignUpView];
      break;
      
    default:
      break;
  }
}

@end
