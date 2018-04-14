//
//  Session+Private.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "Session.h"
#import "BRSerialization.h"
@interface Session (Private)
+ (BRObjectSerialization *) serialiser;
@end
