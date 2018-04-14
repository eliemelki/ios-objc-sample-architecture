//
//  PlaceApiURLGenerator.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlaceApiURLGenerator <NSObject>

- (NSURL *) urlForPlaces;

@end
