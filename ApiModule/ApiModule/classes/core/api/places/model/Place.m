//
//  Place.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Place.h"
#import "Place+Private.h"
#import "PlaceLocation+Private.h"

@implementation Place

+ (BRObjectSerialization *) serialiser
{
    Class _class = [Place class];
  
      NSString *identifierProperty = NSStringFromSelector(@selector(identifier));
      NSString *nameProperty = NSStringFromSelector(@selector(name));
      NSString *placeLocationProperty = NSStringFromSelector(@selector(placeLocation));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"id",identifierProperty,
                                     @"name", nameProperty,
                                     @"location", placeLocationProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    [_serialisation addSerialization:[PlaceLocation serialiser] forProperty:placeLocationProperty];

    return _serialisation;
}

@end


