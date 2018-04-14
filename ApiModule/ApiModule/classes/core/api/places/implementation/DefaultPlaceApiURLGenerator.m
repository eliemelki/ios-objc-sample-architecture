//
//  DefaultPlaceApiURLGenerator.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultPlaceApiURLGenerator.h"


@interface DefaultPlaceApiURLGenerator()

@property (nonatomic, strong) ApiConfiguration *configuration;

@end

@implementation DefaultPlaceApiURLGenerator

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration {
    self = [super init];
    if (self) {
        self.configuration = apiConfiguration;
    }
    return self;
}

- (NSURL *) urlForPlaces {
    NSURL *URL = self.configuration.apiURL;
    return [URL URLByAppendingPathComponent:@"places"];
}

@end
