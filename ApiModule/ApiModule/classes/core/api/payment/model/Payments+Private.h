//
//  Payments+Private.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Payments.h"
#import "BRSerialization.h"


@interface Payments (Private)
+ (BRObjectSerialization *) serialiser;
@end
