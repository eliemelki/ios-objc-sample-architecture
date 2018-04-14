//
//  PlaceModule.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PlaceModule.h"
#import "DefaultPlaceFactory.h"

@interface PlaceModule()

@property (nonatomic, strong) id<PlaceFactory> factory;

@end

@implementation PlaceModule

- (id) initWithApiModule:(ApiModule *)apiModule {
    id<PlaceFactory> factory = [[DefaultPlaceFactory alloc] initWithApiFactory:[apiModule factory]];
    return [self initWithFactory:factory];
}


- (id) initWithFactory:(id<PlaceFactory>)factory {
    self = [super init];
    if (self) {
        self.factory = factory;
        
    }
    return self;
}

- (id<PlaceFactory>) factory {
    return _factory;
}

@end
