//
//  DefaultPlaceFactory.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultPlaceFactory.h"
#import "DefaultPlaceRouter.h"
#import "PlacesPresenter.h"
#import "RentPlacePresenter.h"

@interface DefaultPlaceFactory()
@property (nonatomic, strong) id<ApiFactory> apiFactory;
@end

@implementation DefaultPlaceFactory

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory {
    self = [super init];
    if (self) {
        self.apiFactory = apiFactory;
    }
    return self;
}

- (id<PlaceRouter>) router {
    return [[DefaultPlaceRouter alloc] initWithFactory:self];
}

- (id<PlacesPresenter>) placesPresenter {
    return [[PlacesPresenter alloc] initWithApi:[self.apiFactory placeApi]];
}

- (id<RentPlacePresenter>) rentPlacePresenter {
    return [[RentPlacePresenter alloc] initWithApi:[self.apiFactory paymentApi]];
}


@end
