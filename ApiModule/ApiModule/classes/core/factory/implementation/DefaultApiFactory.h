//
//  DefaultApiFactory.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiConfiguration.h"
#import "ApiFactory.h"

@interface DefaultApiFactory : NSObject<ApiFactory>

- (id) initWithApiConfiguration:(ApiConfiguration *)configuration;

@end
