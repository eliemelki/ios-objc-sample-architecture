//
//  Payments.m
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Payments.h"
#import "Payment+Private.h"

@implementation Payments


+ (BRObjectSerialization *) serialiser
{
    Class _class = [Payments class];
    
    NSString *paymentsProperty = NSStringFromSelector(@selector(data));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"payments",paymentsProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    [_serialisation addSerialization:[BRTypedArraySerialization typedArraySerializationWith:[Payment serialiser]] forProperty:paymentsProperty];
    return _serialisation;
}
@end
