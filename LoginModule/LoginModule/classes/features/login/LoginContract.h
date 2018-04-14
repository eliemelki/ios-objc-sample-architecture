//
//  LoginContract.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ApiModule/ApiModule.h>

@protocol LoginView <NSObject>

- (void) showEmailValidationError:(NSString *)text;
- (void) showPasswordValidationError:(NSString *)text;
- (void) hideEmailValidationError;
- (void) hidePasswordValidationError;
- (void) showLoginError:(NSString *)text;
- (void) showLoading;
- (void) hideLoading;
- (void) loginComplete:(Session *)session;

@end


@protocol LoginPresenter <NSObject>

- (void) setView:(id<LoginView>)view;

- (BOOL) validateEmail:(NSString *)text;
- (BOOL) validatePassword:(NSString *)text;
- (void) submit:(NSString *)email password:(NSString *)password;

@end

