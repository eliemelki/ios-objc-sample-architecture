//
//  Places.m
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Places.h"
#import "Places+Private.h"
#import "Place+Private.h"

@implementation Places

+ (BRObjectSerialization *) serialiser
{
    Class _class = [Places class];
    
    NSString *placesProperty = NSStringFromSelector(@selector(data));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"places",placesProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    [_serialisation addSerialization:[BRTypedArraySerialization typedArraySerializationWith:[Place serialiser]] forProperty:placesProperty];
    return _serialisation;
}

@end
