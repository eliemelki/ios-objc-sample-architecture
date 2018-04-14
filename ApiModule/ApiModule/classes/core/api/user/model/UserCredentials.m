//
//  UserCredentials.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "UserCredentials.h"
#import "UserCredentials+Private.h"

@implementation UserCredentials

- (id) initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (self) {
        _email = email;
        _password = password;
    }
    return self;
}

+ (BRObjectSerialization *) serialiser
{
    Class _class = [UserCredentials class];
    
    NSString *emailProperty = NSStringFromSelector(@selector(email));
    NSString *passwordProperty = NSStringFromSelector(@selector(password));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"email",emailProperty,
                                     @"password", passwordProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];

    return _serialisation;
}

@end
