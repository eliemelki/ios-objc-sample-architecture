//
//  DefaultPaymentRouter.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentRouter.h"
#import "PaymentFactory.h"

@interface DefaultPaymentRouter : NSObject<PaymentRouter>

- (id) initWithFactory:(id<PaymentFactory>)factory;

@end
