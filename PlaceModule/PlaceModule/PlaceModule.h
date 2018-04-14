//
//  PlaceModule.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>


//! Project version number for PlaceModule.
FOUNDATION_EXPORT double PlaceModuleVersionNumber;

//! Project version string for PlaceModule.
FOUNDATION_EXPORT const unsigned char PlaceModuleVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PlaceModule/PublicHeader.h>


#import "RentPlaceContract.h"
#import "PlacesContract.h"
#import "PlaceRouter.h"
#import "PlaceFactory.h"
#import <ApiModule/ApiModule.h>

/*
 Entry point for PlaceModule. PlaceModule has 2 features, show places and rent a bicycle. To use the defaultModule factory and implementation you call with initWithApiModule.
 */
@interface PlaceModule : NSObject

- (id) initWithApiModule:(ApiModule *)apiModule;
- (id) initWithFactory:(id<PlaceFactory>)factory;

- (id<PlaceFactory>) factory;

@end
