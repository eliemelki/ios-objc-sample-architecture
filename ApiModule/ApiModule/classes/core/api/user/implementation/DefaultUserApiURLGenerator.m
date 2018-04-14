//
//  DefaultUserApiURLGenerator.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultUserApiURLGenerator.h"


@interface DefaultUserApiURLGenerator()

@property (nonatomic, strong) ApiConfiguration *configuration;

@end

@implementation DefaultUserApiURLGenerator

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration {
    self = [super init];
    if (self) {
        self.configuration = apiConfiguration;
    }
    return self;
}

- (NSURL *) urlForUsers {
    NSURL *URL = self.configuration.apiURL;
    return [URL URLByAppendingPathComponent:@"users"];
}



@end
