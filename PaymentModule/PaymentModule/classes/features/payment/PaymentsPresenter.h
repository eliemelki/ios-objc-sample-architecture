//
//  PaymentsPresenter.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PaymentContract.h"
#import <ApiModule/ApiModule.h>

@interface PaymentsPresenter : NSObject<PaymentsPresenter>

- (id) initWithApi:(id<PaymentApi>) paymentApi placeApi:(id<PlaceApi>)placeApi;

@end
