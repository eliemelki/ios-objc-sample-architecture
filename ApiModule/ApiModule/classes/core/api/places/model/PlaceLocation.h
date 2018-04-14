//
//  PlaceLocation.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceLocation : NSObject

@property (nonatomic, readonly) double lng;
@property (nonatomic, readonly) double lat;

- (id) initWithLng:(double)lng lat:(double)lat;

@end
