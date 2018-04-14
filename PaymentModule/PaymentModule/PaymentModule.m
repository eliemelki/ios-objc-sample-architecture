//
//  PaymentModule.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentModule.h"
#import "DefaultPaymentFactory.h"

@interface PaymentModule()

@property (nonatomic, strong) id<PaymentFactory> factory;

@end

@implementation PaymentModule

- (id) initWithApiModule:(ApiModule *)apiModule {
    id<PaymentFactory> factory = [[DefaultPaymentFactory alloc] initWithApiFactory:[apiModule factory]];
    return [self initWithFactory:factory];
}


- (id) initWithFactory:(id<PaymentFactory>)factory {
    self = [super init];
    if (self) {
        self.factory = factory;
        
    }
    return self;
}

- (id<PaymentFactory>) factory {
    return _factory;
}

@end
