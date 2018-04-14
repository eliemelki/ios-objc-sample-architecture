//
//  RentPlaceContract.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <ApiModule/ApiModule.h>

@protocol RentPlaceView <NSObject>

- (void) showPlace:(NSString *)place;

- (void) showCreditCardNumberValidationError:(NSString *)error;
- (void) showCreditCardNameValidationError:(NSString *)error;
- (void) showCreditCardCVValidationError:(NSString *)error;
- (void) showCreditCardExpiryMonthValidationError:(NSString *)error;
- (void) showCreditCardExpiryYearValidationError:(NSString *)error;


- (void) hideCreditCardNumberValidationError;
- (void) hideCreditCardNameValidationError;
- (void) hideCreditCardCVValidationError;
- (void) hideCreditCardExpiryMonthValidationError;
- (void) hideCreditCardExpiryYearValidationError;

- (void) showLoginError:(NSString *)text;
- (void) showLoading;
- (void) hideLoading;

- (void) paymentComplete;

- (PayRequestModel *) payRequestModelFromUI;

@end

@protocol RentPlacePresenter <NSObject>

- (void) setView:(id<RentPlaceView>)view;
- (void) setPlace:(Place *)place;


- (BOOL) validateCreditCardNumber:(NSString *)input;
- (BOOL) validateCreditCardName:(NSString *)input;
- (BOOL) validateCreditCardCVV:(NSString *)input;
- (BOOL) validateCreditCardExpiryMonth:(NSString *)input;
- (BOOL) validateCreditCardExpiryYear:(NSString *)input;

- (void) submit;

@end
