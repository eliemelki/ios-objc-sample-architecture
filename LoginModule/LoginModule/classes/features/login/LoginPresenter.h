//
//  LoginPresenter.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginContract.h"
#import <ApiModule/ApiModule.h>

@interface LoginPresenter : NSObject<LoginPresenter>

- (id) initWithUserApi:(id<UserApi>) userApi;

@end
