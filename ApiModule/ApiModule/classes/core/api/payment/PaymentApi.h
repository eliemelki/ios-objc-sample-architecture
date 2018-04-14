//
//  paymentApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiError.h"
#import "Payment.h"
#import "PayRequestModel.h"

@protocol PaymentApi <NSObject>

- (void) getPaymentsOnSuccess:( void ( ^ )( NSArray<Payment *> *payments) )onSuccess onFailure:(void (^)(ApiError *error))onFailure;

- (void) putPayment:(PayRequestModel *)payRequest OnSuccess:( void ( ^ )( void ) )onSuccess onFailure:(void (^)(ApiError *error))onFailure;

@end
