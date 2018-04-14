//
//  PlacesPresenter.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//
#import "PlacesContract.h"
#import <ApiModule/ApiModule.h>

@interface PlacesPresenter : NSObject<PlacesPresenter>

- (id) initWithApi:(id<PlaceApi>) api;

@end
