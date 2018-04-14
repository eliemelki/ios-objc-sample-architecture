//
//  CustomURLSession.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiError.h"
#import "ApiErrorResolver.h"



//Wrapper for NSURLSession. All request goes through this class. This class acts as a proxy for all requests. It allows to implement shared request/response behaviours such as error resolver and detection.
@interface CustomURLSession : NSObject

- (id) initWithErrorResolver:(id<ApiErrorResolver>)errorResolver;

- (NSURLSessionDataTask *) dataTaskWithRequest:(NSURLRequest *)request onSuccess:(void (^)(NSData *data, NSURLResponse *response))onSuccess onFailure:(void (^)(ApiError *error))onFailure;

@end
