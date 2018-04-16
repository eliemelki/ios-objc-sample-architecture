//
//  LoginModuleTests.m
//  LoginModuleTests
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ApiModule/ApiModule.h>
#import <LoginModule/LoginModule.h>
#import "LoginPresenter.h"


@interface MockUserApi : NSObject<UserApi>

@property (nonatomic, strong) ApiError *error;

- (id) initWithError:(ApiError *)error;

@end

@interface MockLoginView : NSObject<LoginView>

@property (nonatomic, strong) NSString *errorMessage;

@property (nonatomic, readonly) BOOL didShowEmailError;
@property (nonatomic, readonly) BOOL didShowPasswordError;
@property (nonatomic, readonly) BOOL didHideEmailValidationError;
@property (nonatomic, readonly) BOOL didHidePasswordValidationError;
@property (nonatomic, readonly) BOOL didShowLoginError;
@property (nonatomic, readonly) BOOL didComleteLogin;

@end


@interface LoginPresenterTests : XCTestCase


@end

@implementation LoginPresenterTests

- (void)setUp {
    [super setUp];
  
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//First Scenario test validation

- (void) testPresenterValidation {
    id<UserApi> userApi = [MockUserApi new];
    MockLoginView *view = [MockLoginView new];
    LoginPresenter *presenter = [[LoginPresenter alloc] initWithUserApi:userApi];
    [presenter setView:view];
    
    [presenter validateEmail:@"ekje"];
    XCTAssertTrue(view.didShowEmailError);
    XCTAssertTrue(!view.didShowPasswordError);
    
    [presenter validatePassword:@"wewe"];
    XCTAssertTrue(view.didShowEmailError);
    XCTAssertTrue(view.didShowPasswordError);
    
    [presenter submit:@"ekje" password:@"wewe"];
    XCTAssertTrue(!view.didComleteLogin);
    
    [presenter validateEmail:@"elie@email.com"];
    XCTAssertTrue(view.didHideEmailValidationError);

    [presenter validatePassword:@"12334455657"];
    XCTAssertTrue(view.didHidePasswordValidationError);
}

- (void) testPresenterPositiveFlow {
    id<UserApi> userApi = [MockUserApi new];
    MockLoginView *view = [MockLoginView new];
    LoginPresenter *presenter = [[LoginPresenter alloc] initWithUserApi:userApi];
    [presenter setView:view];
    [presenter submit:@"elie@email.com" password:@"12334455657"];
    XCTAssertTrue(view.didComleteLogin);
    XCTAssertTrue(!view.didShowLoginError);
}

- (void) testPresenterFailApi {
    NSString *expectedErrorMessage = @"Api failed";
    ApiError *error = [[ApiError alloc] initWithCode:-1 message:expectedErrorMessage];
    id<UserApi> userApi = [[MockUserApi alloc] initWithError:error];
    MockLoginView *view = [MockLoginView new];
    LoginPresenter *presenter = [[LoginPresenter alloc] initWithUserApi:userApi];
    [presenter setView:view];
    [presenter submit:@"elie@email.com" password:@"12334455657"];
    XCTAssertTrue(view.didShowLoginError);
    XCTAssertTrue(!view.didComleteLogin);
    XCTAssertEqualObjects(view.errorMessage, expectedErrorMessage);
}

@end

@implementation MockUserApi

- (id) initWithError:(ApiError *)error {
    self = [super init];
    if (self) {
        self.error = error;
    }
    return self;
}

- (void)loginWitCredentials:(UserCredentials *)credentials success:(void (^)(Session *))onSuccess onFailure:(void (^)(ApiError *))onFailure {
    if (self.error) {
        onFailure(self.error);
    }else {
        onSuccess([Session new]);
    }
}

- (void)registerWitCredentials:(UserCredentials *)credentials success:(void (^)(Session *))onSuccess onFailure:(void (^)(ApiError *))onFailure {
    if (self.error) {
        onFailure(self.error);
    }else {
        onSuccess([Session new]);
    }
}

@end

@implementation MockLoginView

- (void) showEmailValidationError:(NSString *)text {
    _didShowEmailError = YES;
}

- (void) showPasswordValidationError:(NSString *)text {
    _didShowPasswordError = YES;
}

- (void) hideEmailValidationError {
    _didHideEmailValidationError = YES;
}

- (void) hidePasswordValidationError {
    _didHidePasswordValidationError = YES;
}

- (void) showLoginError:(NSString *)text {
    self.errorMessage = text;
    _didShowLoginError = YES;
}

- (void) showLoading {

}

- (void) hideLoading {
 
}

- (void) loginComplete:(Session *)session {
    _didComleteLogin = YES;
}

@end
