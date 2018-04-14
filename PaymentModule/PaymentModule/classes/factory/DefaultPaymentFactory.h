//
//  DefaultPaymentFactory.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentFactory.h"
#import <ApiModule/ApiModule.h>

@interface DefaultPaymentFactory : NSObject<PaymentFactory>

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory;


@end
