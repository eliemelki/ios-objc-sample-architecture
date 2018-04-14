//
//  DefaultErrorResolver.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultErrorResolver.h"
#import "ApiError+Private.h"

@implementation DefaultErrorResolver

- (ApiError *) resolveResponseData:(NSData *)data {
    
    BRObjectSerialization *serialisation = [ApiError serialiser];
    ApiError *error = [NSJSONSerialization JSONObjectWithData:data deserializer:serialisation options:0 error:nil];
    
    if (error == nil) {
        return [[ApiError alloc] initWithCode:-1 message:@"Unknown Error"];
    }else {
        return error;
    }
}
- (ApiError *) resolveError:(NSError *)error {
    NSString *message = [error localizedDescription];
    if (message == nil) {
        message = @"Unknown Error";
    }
    
     return [[ApiError alloc] initWithCode:(int)error.code message:message];
}
@end
