//
//  ApiError+Private.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "ApiError.h"
#import "BRSerialization.h"
@interface ApiError (Private)
+ (BRObjectSerialization *) serialiser;
@end
