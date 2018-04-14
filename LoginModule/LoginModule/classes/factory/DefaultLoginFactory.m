//
//  DefaultLoginFactory.m
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultLoginFactory.h"
#import "RegisterPresenter.h"
#import "LoginPresenter.h"
#import "RegisterContract.h"
#import "LoginContract.h"
#import "DefaultLoginRouter.h"

@interface DefaultLoginFactory()
@property (nonatomic, strong) id<ApiFactory> apiFactory;
@end

@implementation DefaultLoginFactory

- (id) initWithApiFactory:(id<ApiFactory>) apiFactory {
    self = [super init];
    if (self) {
        self.apiFactory = apiFactory;
    }
    return self;
}

- (id<LoginRouter>) router {
    return [[DefaultLoginRouter alloc] initWithFactory:self];
}

- (id<LoginPresenter>) loginPresenter {
    return [[LoginPresenter alloc] initWithUserApi:[self.apiFactory userApi]];
}


- (id<RegisterPresenter>) registerPresenter {
    return [[RegisterPresenter alloc] initWithUserApi:[self.apiFactory userApi]];
}



@end
