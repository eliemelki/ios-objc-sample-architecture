//
//  Session.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Session.h"
#import "Session+Private.h"

@implementation Session

- (id) initWithToken:(NSString *)token {
    self = [super init];
    if (self) {
        _token = token;
    }
    return self;
}

+ (BRObjectSerialization *) serialiser
{
    Class _class = [Session class];
    
    NSString *tokenProperty = NSStringFromSelector(@selector(token));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"token",tokenProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    
    return _serialisation;
}


@end
