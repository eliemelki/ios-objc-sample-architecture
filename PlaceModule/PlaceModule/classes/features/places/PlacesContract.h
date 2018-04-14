//
//  PlacesContract.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <ApiModule/ApiModule.h>


@protocol PlacesView <NSObject>
- (void) showPlaces:(NSArray<Place *> *)places;
- (void) showLoginError:(NSString *)text;
- (void) showLoading;
- (void) hideLoading;
@end

@protocol PlacesPresenter <NSObject>

- (void) setView:(id<PlacesView>)view;

@end
