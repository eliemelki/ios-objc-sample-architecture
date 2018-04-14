//
//  ApiModule.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "ApiModule.h"
#import "DefaultApiFactory.h"

@interface ApiModule()

@property (nonatomic, strong) id<ApiFactory> factory;

@end

@implementation ApiModule

- (id) initWithFactory:(id<ApiFactory>)factory {
    self = [super init];
    if (self) {
        self.factory = factory;
    }
    return self;
}
- (id) initWithApiConfiguration:(ApiConfiguration *)configuration {
    id<ApiFactory> fact = [[DefaultApiFactory alloc] initWithApiConfiguration:configuration];
    return [self initWithFactory:fact];
}

- (id<ApiFactory>) factory {
    return _factory;
}

@end
