//
//  DefaultPlaceApi.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultPlaceApi.h"
#import "Places.h"
#import "Places+Private.h"

@interface DefaultPlaceApi()

@property (nonatomic, strong) id<PlaceApiURLGenerator> urlGenerator;
@property (nonatomic, strong) id<SessionManager> sessionManager;
@property (nonatomic, strong) CustomURLSession *urlSession;

@end

@implementation DefaultPlaceApi

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<PlaceApiURLGenerator>) urlGenerator sessionManager:(id<SessionManager>)sessionManager {
    self = [super init];
    if (self) {
        self.urlSession = urlSession;
        self.urlGenerator = urlGenerator;
        self.sessionManager  = sessionManager;
    }
    return self;
}

- (void) getPlacesOnSuccess:( void ( ^ )( NSArray<Place *> *places) )onSuccess onFailure:(void (^)(ApiError *error))onFailure {
    NSURL *URL = [self.urlGenerator urlForPlaces];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    request.HTTPMethod = @"GET";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionTask *task = [self.urlSession dataTaskWithRequest:request onSuccess:^(NSData *data, NSURLResponse *response) {
        //TODO handle deserialise error
        BRObjectSerialization *serialisation = [Places serialiser];
        Places *places = [NSJSONSerialization JSONObjectWithData:data deserializer:serialisation options:0 error:nil];
        NSArray<Place *>* array = places.data;
        onSuccess(array);
    } onFailure:onFailure];
    [task resume];
}

- (void) appendTokenToURLRequest:(NSMutableURLRequest *)request
{
    Session *session = [self.sessionManager retrieveSession];
    NSString *apiKey = [NSString stringWithFormat:@"bearer %@",session.token];
    [request setValue:apiKey forHTTPHeaderField:@"Authorization"];
}

@end
