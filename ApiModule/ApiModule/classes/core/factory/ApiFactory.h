//
//  ApiFactory.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserApi.h"
#import "PlaceApi.h"
#import "PaymentApi.h"
#import "SessionManager.h"

@protocol ApiFactory <NSObject>

- (id<UserApi>) userApi;
- (id<PlaceApi>) placeApi;
- (id<PaymentApi>) paymentApi;
- (id<SessionManager>) sessionManager;

@end
