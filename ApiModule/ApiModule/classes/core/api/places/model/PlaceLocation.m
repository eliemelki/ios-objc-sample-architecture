//
//  PlaceLocation.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "PlaceLocation.h"
#import "PlaceLocation+Private.h"

@implementation PlaceLocation 

- (id) initWithLng:(double)lng lat:(double)lat {
    self = [super init];
    if (self) {
        _lng = lng;
        _lat = lat;
    }
    return self;
}

+ (BRObjectSerialization *) serialiser {
    Class _class = [PlaceLocation class];
    
    NSString *lngProperty = NSStringFromSelector(@selector(lng));
    NSString *latProperty = NSStringFromSelector(@selector(lat));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"lng",lngProperty,
                                     @"lat", latProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    
    return _serialisation;
}

@end
