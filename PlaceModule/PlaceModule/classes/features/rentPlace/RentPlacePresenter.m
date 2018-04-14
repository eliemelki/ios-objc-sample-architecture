//
//  RentPlacePresenter.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "RentPlacePresenter.h"

@interface RentPlacePresenter()

@property (nonatomic, strong) id<PaymentApi> api;
@property (nonatomic, weak) id<RentPlaceView> view;
@property (nonatomic, strong) Place *place;
@end

@implementation RentPlacePresenter


- (id) initWithApi:(id<PaymentApi>) api {
    self = [super init];
    if (self) {
        self.api = api;
    }
    return self;
}

#pragma mark - Presenter
- (void) setView:(id<RentPlaceView>)view {
    _view = view;
    [self.view showPlace:self.place.name];
}

- (void)submit {
    PayRequestModel *requestModel = [self.view payRequestModelFromUI];
    if ([self isValid:requestModel]) {
        requestModel.placeId = self.place.identifier;
        [self.view showLoading];
        [self.api putPayment:requestModel OnSuccess:^{
            [self.view hideLoading];
            [self.view paymentComplete];
        } onFailure:^(ApiError *error) {
            [self.view hideLoading];
            [self.view showLoginError:error.message];
        }];
    }
}

- (BOOL)validateCreditCardCVV:(NSString *)input {
    NSString *error = [self errorFromCreditCardNumberCVV:input];
    if (error) {
        [self.view showCreditCardCVValidationError:error];
        return NO;
    }else {
        [self.view hideCreditCardCVValidationError];
        return YES;
    }
}

- (BOOL)validateCreditCardExpiryMonth:(NSString *)input {
    NSString *error = [self errorFromCreditCardExpiryMonth:input];
    if (error) {
        [self.view showCreditCardExpiryMonthValidationError:error];
        return NO;
    }else {
        [self.view hideCreditCardExpiryMonthValidationError];
        return YES;
    }
}

- (BOOL)validateCreditCardExpiryYear:(NSString *)input {
    NSString *error = [self errorFromCreditCardExpiryYear:input];
    if (error) {
        [self.view showCreditCardExpiryYearValidationError:error];
        return NO;
    }else {
        [self.view hideCreditCardExpiryYearValidationError];
        return YES;
    }
}

- (BOOL)validateCreditCardName:(NSString *)input {
    NSString *error = [self errorFromCreditCardNumberName:input];
    if (error) {
        [self.view showCreditCardNameValidationError:error];
        return NO;
    }else {
        [self.view hideCreditCardNameValidationError];
        return YES;
    }
}

- (BOOL)validateCreditCardNumber:(NSString *)input {
    NSString *error = [self errorFromCreditCardNumberValidation:input];
    if (error) {
        [self.view showCreditCardNumberValidationError:error];
        return NO;
    }else {
        [self.view hideCreditCardNumberValidationError];
        return YES;
    }
}

#pragma mark - Private

- (BOOL) isValid:(PayRequestModel *)requestModel {
    return [self validateCreditCardCVV:requestModel.cvv]&&
    [self validateCreditCardName:requestModel.name] &&
    [self validateCreditCardNumber:requestModel.number] &&
    [self validateCreditCardExpiryYear:requestModel.expiryYear] &&
    [self validateCreditCardExpiryMonth:requestModel.expiryMonth];
    ;
}

- (NSString *) errorFromCreditCardNumberValidation:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Credit Card number cannot be empty";
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *myNumber = [formatter numberFromString:input];
    if (myNumber == nil) {
        return @"Credit Card number contains characters";
    }
    
    if ([input length] != 16) {
        return @"Credit Card number must be 16 digits";
    }
    
    return nil;
}

- (NSString *) errorFromCreditCardNumberName:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Credit Card name cannot be empty";
    }
    
    return nil;
}

- (NSString *) errorFromCreditCardNumberCVV:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Credit Card cvv cannot be empty";
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *myNumber = [formatter numberFromString:input];
    if (myNumber == nil) {
        return @"Credit Card cvv contains characters";
    }
    
    if ([input length] != 3) {
        return @"Credit Card cvv be must 3 digits";
    }
    
    return nil;
}

- (NSString *) errorFromCreditCardExpiryMonth:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Credit Card month cannot be empty";
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *myNumber = [formatter numberFromString:input];
    if (myNumber == nil) {
        return @"Credit Card  month contains characters";
    }
    
    if ([myNumber intValue] <= 0 || [myNumber intValue] > 12) {
        return @"Credit Card month must be between 1 and 12";
    }
    
    return nil;
}


- (NSString *) errorFromCreditCardExpiryYear:(NSString *)input {
    if (input == nil || input.length <= 0) {
        return @"Credit Card month cannot be empty";
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *myNumber = [formatter numberFromString:input];
    if (myNumber == nil) {
        return @"Credit Card year contains characters";
    }
    
    return nil;
}


@end

