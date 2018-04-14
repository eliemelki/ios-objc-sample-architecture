//
//  RentPlacePresenter.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "RentPlaceContract.h"
#import <ApiModule/ApiModule.h>

@interface RentPlacePresenter : NSObject<RentPlacePresenter>

- (id) initWithApi:(id<PaymentApi>) api;

@end






