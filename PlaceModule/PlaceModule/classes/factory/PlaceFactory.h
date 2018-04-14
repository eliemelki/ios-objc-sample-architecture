//
//  PlaceFactory.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlacesContract.h"
#import "RentPlaceContract.h"
#import "PlaceRouter.h"

@protocol PlaceFactory <NSObject>

- (id<PlaceRouter>) router;
- (id<PlacesPresenter>) placesPresenter;
- (id<RentPlacePresenter>) rentPlacePresenter;

@end
