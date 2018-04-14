//
//  DefaultPlaceApiURLGenerator.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlaceApiURLGenerator.h"
#import "ApiConfiguration.h"

@interface DefaultPlaceApiURLGenerator : NSObject<PlaceApiURLGenerator>

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration;

@end
