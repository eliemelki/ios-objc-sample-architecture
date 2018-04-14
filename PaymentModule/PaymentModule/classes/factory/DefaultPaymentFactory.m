//
//  DefaultPaymentFactory.m
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultPaymentFactory.h"

#import "PaymentsPresenter.h"
#import "DefaultPaymentRouter.h"


@interface DefaultPaymentFactory()
@property (nonatomic, strong) id<ApiFactory> apiFactory;
@end

@implementation DefaultPaymentFactory

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory {
    self = [super init];
    if (self) {
        self.apiFactory = apiFactory;
    }
    return self;
}

- (id<PaymentRouter>) router {
    return [[DefaultPaymentRouter alloc] initWithFactory:self];
}

- (id<PaymentsPresenter>)paymentsPresenter {
    return [[PaymentsPresenter alloc] initWithApi:[self.apiFactory paymentApi] placeApi:[self.apiFactory placeApi]];
}




@end
