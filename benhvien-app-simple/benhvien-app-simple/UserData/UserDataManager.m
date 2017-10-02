//
//  UserDataManager.m
//  benhvien-app-simple
//
//  Created by test on 9/15/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "UserDataManager.h"

@implementation UserDataManager
@synthesize accessToken = _accessToken;
@synthesize userId = _userId;
@synthesize role = _role;
@synthesize email = _email;
@synthesize city = _city;
@synthesize fullName = _fullName;

+ (instancetype)sharedClient {
  static UserDataManager *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[UserDataManager alloc] init];
  });
  return _sharedClient;
}

- (void)setUserData:(NSDictionary *)data {
  self.accessToken = [data objectForKey:@"token"];
  self.userId = [data objectForKey:@"userId"];
  self.role = [data objectForKey:@"role"];
  self.email = [data objectForKey:@"email"];
  self.city = [data objectForKey:@"city"];
  self.fullName = [data objectForKey:@"fullName"];
}

- (void)clearUserData {
  [NSUserDefaults setObject:nil forKey:UserToken];
  [NSUserDefaults setObject:nil forKey:UserId];
  [NSUserDefaults setObject:nil forKey:UserRole];
  [NSUserDefaults setObject:nil forKey:UserEmail];
  [NSUserDefaults setObject:nil forKey:UserCity];
  [NSUserDefaults setObject:nil forKey:UserFullName];
}

- (void)setAccessToken:(NSString *)accessToken {
  _accessToken = accessToken;
  [NSUserDefaults setObject:accessToken forKey:UserToken];
}

- (NSString *)accessToken {
  NSString *accessToken = [NSUserDefaults objectForKey:UserToken];
  if (accessToken) {
    return accessToken;
  } else {
    return @"";
  }
}

- (void)setUserId:(NSString *)userId {
  _userId = userId;
  [NSUserDefaults setObject:userId forKey:UserId];
}

- (NSString *)userId {
  NSString *userId = [NSUserDefaults objectForKey:UserId];
  if (userId) {
    return userId;
  } else {
    return @"";
  }
}

- (void)setRole:(NSString *)role {
  _role = role;
  [NSUserDefaults setObject:role forKey:UserRole];
}

- (NSString *)role {
  NSString *role = [NSUserDefaults objectForKey:UserRole];
  if (role) {
    return role;
  } else {
    return @"";
  }}

- (void)setEmail:(NSString *)email {
  _email = email;
  [NSUserDefaults setObject:email forKey:UserEmail];
}

- (NSString *)email {
  NSString *email = [NSUserDefaults objectForKey:UserEmail];
  if (email) {
    return email;
  } else {
    return @"";
  }
}

- (void)setCity:(NSString *)city {
    _city = city;
    [NSUserDefaults setObject:city forKey:UserCity];
}

- (NSString *)city {
    NSString *city = [NSUserDefaults objectForKey:UserCity];
    if (city) {
        return city;
    } else {
        return @"";
    }
}

- (void)setFullName:(NSString *)fullName {
  _fullName = fullName;
  [NSUserDefaults setObject:fullName forKey:UserFullName];
}

- (NSString *)fullName {
  NSString *fullName = [NSUserDefaults objectForKey:UserFullName];
  if (fullName) {
    return fullName;
  } else {
    return @"";
  }
}

@end
