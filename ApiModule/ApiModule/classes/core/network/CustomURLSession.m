//
//  CustomURLSession.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "CustomURLSession.h"


@interface CustomURLSession()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) id<ApiErrorResolver> errorResolver;


@end


@implementation CustomURLSession

- (id) initWithErrorResolver:(id<ApiErrorResolver>)errorResolver
{
    self = [super init];
    if (self)
    {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        self.errorResolver = errorResolver;
    }
    return self;
}

- (void) dealloc
{
    [self.session invalidateAndCancel];
}



- (NSURLSessionDataTask *) dataTaskWithRequest:(NSURLRequest *)request onSuccess:(void (^)(NSData *, NSURLResponse *))onSuccess onFailure:(void (^)(ApiError *))onFailure {
    
    //execute request
    return [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //check first if there is an error
            if (error != nil) {
                //resolve error
                ApiError *apiError = [self.errorResolver resolveError:error];
                if (onFailure) {
                    onFailure(apiError);
                }
            }else {
                //check if response has valid status code.
                if ([response isKindOfClass:[NSHTTPURLResponse class]] &&
                    ![self isValidStatusCode:(NSHTTPURLResponse *)response] ) {
                    ApiError *apiError = [self.errorResolver resolveResponseData:data];
                    if (onFailure) {
                        onFailure(apiError);
                    }
                }else {
                    if (onSuccess) {
                        onSuccess(data, response);
                    }
                }
            }
        });
       
    }];
}

- (BOOL) isValidStatusCode:(NSHTTPURLResponse *)response
{
    //check if response status code falls between 200 and 399.
    NSIndexSet *acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 200)];
    return [acceptableStatusCodes containsIndex:(NSUInteger)response.statusCode];
    
}

@end


