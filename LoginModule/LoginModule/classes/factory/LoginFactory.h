//
//  LoginModuleFactory.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRouter.h"
#import "LoginContract.h"
#import "RegisterContract.h"

@protocol LoginFactory <NSObject>

- (id<LoginRouter>) router;
- (id<LoginPresenter>) loginPresenter;
- (id<RegisterPresenter>) registerPresenter;

@end
