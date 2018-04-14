//
//  DefaultPlaceFactory.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceFactory.h"
#import <ApiModule/ApiModule.h>

@interface DefaultPlaceFactory : NSObject<PlaceFactory>

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory;

@end
