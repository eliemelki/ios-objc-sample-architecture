//
//  ErrorResolver.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiError.h"

//Used to provide a mechanism that map error code to appropriate error message.
@protocol ApiErrorResolver <NSObject>

- (ApiError *) resolveResponseData:(NSData *)data;
- (ApiError *) resolveError:(NSError *)error;
@end
