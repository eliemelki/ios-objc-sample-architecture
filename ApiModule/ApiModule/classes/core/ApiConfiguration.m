//
//  ApiConfiguration.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "ApiConfiguration.h"

@implementation ApiConfiguration

- (id) initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        _apiURL = url;
    }
    return self;
}
@end
