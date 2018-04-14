//
//  UserApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCredentials.h"
#import "Session.h"
#import "ApiError.h"

@protocol UserApi <NSObject>

- (void) loginWitCredentials:(UserCredentials *)credentials success:( void ( ^ )( Session * session) )onSuccess onFailure:(void (^)(ApiError *error))onFailure;

- (void) registerWitCredentials:(UserCredentials *)credentials success:( void ( ^ )( Session * session) )onSuccess onFailure:(void (^)(ApiError *error))onFailure;

@end
