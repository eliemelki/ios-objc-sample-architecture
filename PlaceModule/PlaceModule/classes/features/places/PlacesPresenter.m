//
//  PlacesPresenter.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PlacesPresenter.h"

@interface PlacesPresenter()

@property (nonatomic, strong) id<PlaceApi> api;
@property (nonatomic, weak) id<PlacesView> view;
@end

@implementation PlacesPresenter


- (id) initWithApi:(id<PlaceApi>) api {
    self = [super init];
    if (self) {
        self.api = api;
    }
    return self;
}

- (void) setView:(id<PlacesView>)view {
    _view = view;
    [self.view showLoading];
    
    [self.api getPlacesOnSuccess:^(NSArray<Place *> *places) {
        [self.view showPlaces:places];
        [self.view hideLoading];
    } onFailure:^(ApiError *error) {
        [self.view hideLoading];
        [self.view showLoginError:error.message];
    }];
    
}

@end

