//
//  PaymentViewModel.m
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentViewModel.h"

@interface PaymentViewModel()

@property (nonatomic, strong) Payment *payment;
@property (nonatomic, strong) Place *place;

@end

@implementation PaymentViewModel

- (id) initWithPayment:(Payment *)payment place:(Place *)place {
    self = [super init];
    if (self) {
        self.payment = payment;
        self.place = place;
    }
    return self;
}

- (NSString *) creditCardNumber {
    NSString *creditCardNumber = self.payment.creditCard.number;
    NSString *lastFour = [creditCardNumber substringFromIndex:[creditCardNumber length] - 4];
     NSString *firstFour = [creditCardNumber substringToIndex:4];
    return [NSString stringWithFormat:@"%@-****-****-%@", firstFour, lastFour];
}

- (NSString *) placeName {
    return self.place.name;
}

@end
