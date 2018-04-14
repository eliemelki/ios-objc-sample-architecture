//
//  ApiError.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "ApiError.h"
#import "ApiError+Private.h"

@implementation ApiError

- (id) initWithCode:(int)code message:(NSString *)message {
    self = [super init];
    if (self) {
        _code = code;
        _message = message;
    }
    return self;
}

+ (BRObjectSerialization *) serialiser
{
    Class _class = [ApiError class];
    
    NSString *codeProperty = NSStringFromSelector(@selector(code));
    NSString *messageProperty = NSStringFromSelector(@selector(message));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"code",codeProperty,
                                     @"message", messageProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    
    return _serialisation;
}
@end
