//
//  DefaultUserApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserApi.h"
#import "CustomURLSession.h"
#import "UserApiURLGenerator.h"
#import "SessionManager.h"

@interface DefaultUserApi : NSObject<UserApi>

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<UserApiURLGenerator>) urlGenerator sessionManager:(id<SessionManager>)sessionManager;


@end


