//
//  DefaultLoginRouter.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRouter.h"
#import "LoginFactory.h"

@interface DefaultLoginRouter : NSObject<LoginRouter>

- (id) initWithFactory:(id<LoginFactory>)factory;

@end
