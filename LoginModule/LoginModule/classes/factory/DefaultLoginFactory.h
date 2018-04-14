//
//  DefaultLoginFactory.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginFactory.h"

@interface DefaultLoginFactory : NSObject<LoginFactory>

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory;

@end
