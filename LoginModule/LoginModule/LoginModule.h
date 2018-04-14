//
//  LoginModule.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
//! Project version number for api.
FOUNDATION_EXPORT double apiVersionNumber;

//! Project version string for api.
FOUNDATION_EXPORT const unsigned char apiVersionString[];

#import <ApiModule/ApiModule.h>

#import "LoginFactory.h"
#import "LoginContract.h"
#import "RegisterContract.h"
#import "LoginRouter.h"

/*
Entry point for Login Module. LoginModule has 2 features, LoginPage and RegisterPage. To use the defaultModule factory and implementation you call with initWithApiModule.
 */

@interface LoginModule : NSObject

- (id) initWithApiModule:(ApiModule *)apiModule;

//This will allow you pass a factory and customise any default implementation
- (id) initWithFactory:(id<LoginFactory>)factory;

- (id<LoginFactory>) factory;

@end
