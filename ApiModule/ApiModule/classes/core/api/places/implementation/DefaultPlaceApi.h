//
//  DefaultPlaceApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlaceApi.h"
#import "CustomURLSession.h"
#import "PlaceApiURLgenerator.h"
#import "SessionManager.h"

@interface DefaultPlaceApi : NSObject<PlaceApi>

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<PlaceApiURLGenerator>) urlGenerator  sessionManager:(id<SessionManager>)sessionManager;
@end
