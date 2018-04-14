//
//  DefaultUserApi.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultUserApi.h"
#import "Session+Private.h"
#import "UserCredentials+Private.h"

@interface DefaultUserApi()

@property (nonatomic, strong) id<UserApiURLGenerator> urlGenerator;
@property (nonatomic, strong) CustomURLSession *urlSession;
@property (nonatomic, strong) id<SessionManager> sessionManager;
@end

@implementation DefaultUserApi

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<UserApiURLGenerator>) urlGenerator  sessionManager:(id<SessionManager>)sessionManager {
    self = [super init];
    if (self) {
        self.urlSession = urlSession;
        self.urlGenerator = urlGenerator;
        self.sessionManager = sessionManager;
    }
    return self;
}

- (void) loginWitCredentials:(UserCredentials *)credentials success:( void ( ^ )( Session * ) )onSuccess onFailure:(void (^)(ApiError *error))onFailure {
     NSURL *URL = [self.urlGenerator urlForUsers];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //TODO handle serialise error
    NSData *data = [NSJSONSerialization dataWithJSONObject:credentials serializer:[UserCredentials serialiser] options:0 error:nil];
    [request setHTTPBody:data];
    
   NSURLSessionTask *task = [self.urlSession dataTaskWithRequest:request onSuccess:^(NSData *data, NSURLResponse *response) {
        BRObjectSerialization *serialisation = [Session serialiser];
       Session *session =  [NSJSONSerialization JSONObjectWithData:data deserializer:serialisation options:0 error:nil];
        [self.sessionManager saveSession:session];
        onSuccess(session);
    } onFailure:onFailure];
    [task resume];
}

- (void) registerWitCredentials:(UserCredentials *)credentials success:( void ( ^ )( Session * ) )onSuccess onFailure:(void (^)(ApiError *error))onFailure {
     NSURL *URL = [self.urlGenerator urlForUsers];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    request.HTTPMethod = @"PUT";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //TODO handle serialise error
    NSData *data = [NSJSONSerialization dataWithJSONObject:credentials serializer:[UserCredentials serialiser] options:0 error:nil];
    [request setHTTPBody:data];
    
   NSURLSessionTask *task = [self.urlSession dataTaskWithRequest:request onSuccess:^(NSData *data, NSURLResponse *response) {
        BRObjectSerialization *serialisation = [Session serialiser];
      Session *session =  [NSJSONSerialization JSONObjectWithData:data deserializer:serialisation options:0 error:nil];
        [self.sessionManager saveSession:session];
        onSuccess(session);
    } onFailure:onFailure];
    [task resume];
}

@end
