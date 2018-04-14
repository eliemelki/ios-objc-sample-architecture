//
//  CreditCard.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "CreditCard.h"
#import "CreditCard+Private.h"

@implementation CreditCard

+ (BRObjectSerialization *) serialiser
{
    Class _class = [CreditCard class];
    
    NSString *numberProperty = NSStringFromSelector(@selector(number));
    NSString *nameProperty = NSStringFromSelector(@selector(name));
    NSString *cvvProperty = NSStringFromSelector(@selector(cvv));
    NSString *expiryMonthProperty = NSStringFromSelector(@selector(expiryMonth));
    NSString *expiryYearProperty = NSStringFromSelector(@selector(expiryYear));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"number",numberProperty,
                                     @"name", nameProperty,
                                     @"cvv", cvvProperty,
                                     @"expiryMonth", expiryMonthProperty,
                                     @"expiryYear", expiryYearProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
   
    return _serialisation;
}

@end
