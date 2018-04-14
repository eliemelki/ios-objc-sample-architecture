//
//  Payment.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Payment.h"
#import "Payment+Private.h"
#import "CreditCard+Private.h"

@implementation Payment

+ (BRObjectSerialization *) serialiser
{
    Class _class = [Payment class];
    
    NSString *creditCardProperty = NSStringFromSelector(@selector(creditCard));
    NSString *emailProperty = NSStringFromSelector(@selector(email));
    NSString *placeIdProperty = NSStringFromSelector(@selector(placeId));
    
    NSDictionary *_propertyMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"creditCard",creditCardProperty,
                                     @"email", emailProperty,
                                     @"placeId", placeIdProperty,
                                     nil];
    
    BRObjectSerialization *_serialisation = [BRObjectSerialization objectSerializationWith:_class propertiesMapper:_propertyMapper];
    [_serialisation addSerialization:[CreditCard serialiser] forProperty:creditCardProperty];
    return _serialisation;
}
@end
