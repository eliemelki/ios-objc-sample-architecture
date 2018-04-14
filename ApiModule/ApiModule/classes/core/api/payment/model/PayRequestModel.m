//
//  PayRequestModel.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "PayRequestModel.h"
#import "PayRequestModel+Private.h"

@implementation PayRequestModel

+ (BRObjectSerialization *) serialiser
{
    Class _class = [PayRequestModel class];
    
    NSString *numberProperty = NSStringFromSelector(@selector(number));
    NSString *nameProperty = NSStringFromSelector(@selector(name));
    NSString *cvvProperty = NSStringFromSelector(@selector(cvv));
    NSString *expiryMonthProperty = NSStringFromSelector(@selector(expiryMonth));
    NSString *expiryYearProperty = NSStringFromSelector(@selector(expiryYear));
    NSString *placeIdProperty = NSStringFromSelector(@selector(placeId));
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"number",numberProperty,
                                     @"name", nameProperty,
                                     @"cvv", cvvProperty,
                                     @"expiryMonth", expiryMonthProperty,
                                     @"expiryYear", expiryYearProperty,
                                     @"placeId",placeIdProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    
    return _serialisation;
}

@end
