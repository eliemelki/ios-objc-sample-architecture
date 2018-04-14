//
//  DefaultUserApiURLGenerator.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserApiURLGenerator.h"
#import "ApiConfiguration.h"

@interface DefaultUserApiURLGenerator : NSObject<UserApiURLGenerator>

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration;

@end



