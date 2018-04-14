//
//  DefaultPlaceRouter.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceFactory.h"

@interface DefaultPlaceRouter : NSObject<PlaceRouter>

- (id) initWithFactory:(id<PlaceFactory>)factory;

@end
