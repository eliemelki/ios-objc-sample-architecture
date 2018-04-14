//
//  PaymentModule.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for PaymentModule.
FOUNDATION_EXPORT double PaymentModuleVersionNumber;

//! Project version string for PaymentModule.
FOUNDATION_EXPORT const unsigned char PaymentModuleVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PaymentModule/PublicHeader.h>


#import <ApiModule/ApiModule.h>
#import "PaymentContract.h"
#import "PaymentRouter.h"
#import "PaymentFactory.h"
#import "PaymentViewModel.h"

/*
 Entry point for Payment Module. Payment Module has one feature which is to display the payment history. To use the defaultModule factory and implementation you call with initWithApiModule.
 */
@interface PaymentModule : NSObject

- (id) initWithApiModule:(ApiModule *)apiModule;
- (id) initWithFactory:(id<PaymentFactory>)factory;

- (id<PaymentFactory>) factory;

@end
