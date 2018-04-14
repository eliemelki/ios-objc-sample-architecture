//
//  LoginPresenter.m
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "LoginPresenter.h"


@interface LoginPresenter()

@property (nonatomic, strong) id<UserApi> userApi;
@property (nonatomic, weak) id<LoginView> view;
@end

@implementation LoginPresenter


- (id) initWithUserApi:(id<UserApi>) userApi {
    self = [super init];
    if (self) {
        self.userApi = userApi;
    }
    return self;
}

#pragma mark - Presenter

- (void) setView:(id<LoginView>)view {
    _view = view;
}

- (void)submit:(NSString *)email password:(NSString *)password {
    
    if ([self isModelValid:email password:password]) {
        UserCredentials *credentials = [[UserCredentials alloc] initWithEmail:email password:password];
        [self.view showLoading];
        [self.userApi loginWitCredentials:credentials success:^(Session *session) {
            [self.view hideLoading];
              [self.view loginComplete:session];
        } onFailure:^(ApiError *error) {
            [self.view hideLoading];
            [self.view showLoginError:error.message];
        }];
    }
}


- (BOOL)validateEmail:(NSString *)email {
    NSString *emailError = [self errorFromEmailValidation:email];
    if (emailError != nil) {
        [self.view showEmailValidationError:emailError];
        return NO;
    }else {
        [self.view hideEmailValidationError];
        return YES;
    }
}


- (BOOL)validatePassword:(NSString *)text {
    NSString *passwordError = [self errorFromPasswordValidation:text];
    
    if (passwordError != nil) {
        [self.view showPasswordValidationError:passwordError];
        return NO;
    }else {
        [self.view hidePasswordValidationError];
        return YES;
    }
}




#pragma mark - Private

- (BOOL) isModelValid:(NSString *)email password:(NSString *)password {
    return [self validateEmail:email] && [self validatePassword:password];
}


- (NSString *) errorFromEmailValidation:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Email cannot be empty";
    }
    
    if (![input isValidEmail]) {
         return @"Not a valid email";
    }
    return nil;
}

- (NSString *) errorFromPasswordValidation:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Password cannot be empty";
    }
    
    if (input.length < 8) {
        return @"Password must be at least 8";
    }
    return nil;
}


@end
