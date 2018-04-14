//
//  ApiModule.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for api.
FOUNDATION_EXPORT double apiVersionNumber;

//! Project version string for api.
FOUNDATION_EXPORT const unsigned char apiVersionString[];

#import "MockApiFactory.h"

#import "ApiModule.h"
#import "ApiFactory.h"
#import "UserApi.h"
#import "PlaceApi.h"
#import "PaymentApi.h"
#import "SessionManager.h"



//models
#import "CreditCard.h"
#import "Session.h"
#import "Payment.h"
#import "PayRequestModel.h"
#import "Place.h"
#import "PlaceLocation.h"
#import "ApiConfiguration.h"

#import "NSString+Validation.h"

/*
 Entry point for Api Module. ApiModule implements the rest calls. To use the defaultModule factory and implementation you call with initWithApiModule.
 */
@interface ApiModule : NSObject

- (id) initWithFactory:(id<ApiFactory>)factory;
- (id) initWithApiConfiguration:(ApiConfiguration *)configuration;

- (id<ApiFactory>) factory;
@end
