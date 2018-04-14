//
//  DefaultPaymentApiURLGenerator.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultPaymentApiURLGenerator.h"

@interface DefaultPaymentApiURLGenerator()

@property (nonatomic, strong) ApiConfiguration *configuration;

@end

@implementation DefaultPaymentApiURLGenerator

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration {
    self = [super init];
    if (self) {
        self.configuration = apiConfiguration;
    }
    return self;
}

- (NSURL *) urlForPayments {
    NSURL *URL = self.configuration.apiURL;
    return [URL URLByAppendingPathComponent:@"payments"];
}

- (NSURL *) urlForPutPayments {
    NSURL *URL = self.configuration.apiURL;
    return [URL URLByAppendingPathComponent:@"payments"];
}

@end
