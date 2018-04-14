//
//  UserCredentials+Private.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "UserCredentials.h"
#import "BRSerialization.h"

@interface UserCredentials (Private)
+ (BRObjectSerialization *) serialiser;
@end
