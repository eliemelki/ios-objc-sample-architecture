//
//  Places.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface Places : NSObject

@property (nonatomic, strong, readonly) NSArray<Place *> *data;

@end
