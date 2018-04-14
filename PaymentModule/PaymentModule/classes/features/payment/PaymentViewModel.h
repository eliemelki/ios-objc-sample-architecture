//
//  PaymentViewModel.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <ApiModule/ApiModule.h>


@interface PaymentViewModel : NSObject

- (id) initWithPayment:(Payment *)payment place:(Place *)place;

- (NSString *) creditCardNumber;
- (NSString *) placeName;

@end
