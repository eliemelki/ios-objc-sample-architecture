//
//  placesApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"
#import "ApiError.h"

@protocol PlaceApi <NSObject>

- (void) getPlacesOnSuccess:( void ( ^ )( NSArray<Place *> *places) )onSuccess onFailure:(void (^)(ApiError *error))onFailure;

@end
