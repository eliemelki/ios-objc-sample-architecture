//
//  LoginModule.m
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "LoginModule.h"
#import "DefaultLoginFactory.h"

@interface LoginModule()

@property (nonatomic, strong) id<LoginFactory> factory;

@end

@implementation LoginModule

- (id) initWithApiModule:(ApiModule *)apiModule {
    id<LoginFactory> factory = [[DefaultLoginFactory alloc] initWithApiFactory:[apiModule factory]];
    return [self initWithFactory:factory];
}

- (void) dealloc {
    
}


- (id) initWithFactory:(id<LoginFactory>)factory {
    self = [super init];
    if (self) {
        self.factory = factory;
        
    }
    return self;
}

- (id<LoginFactory>) factory {
    return _factory;
}

@end
