//
//  Payment+Private.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//


#import "BRSerialization.h"
#import "Payment.h"

@interface Payment (Private)
+ (BRObjectSerialization *) serialiser;

@end
