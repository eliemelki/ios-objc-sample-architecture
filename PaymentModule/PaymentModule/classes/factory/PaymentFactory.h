//
//  PaymentFactory.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "PaymentRouter.h"
#import "PaymentContract.h"

@protocol PaymentFactory <NSObject>

- (id<PaymentRouter>) router;
- (id<PaymentsPresenter>) paymentsPresenter;

@end
