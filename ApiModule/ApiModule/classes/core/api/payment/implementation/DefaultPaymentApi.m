//
//  DefaultPaymentApi.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultPaymentApi.h"
#import "Payments.h"
#import "Payments+Private.h"
#import "PayRequestModel+Private.h"

@interface DefaultPaymentApi()

@property (nonatomic, strong) id<PaymentApiURLGenerator> urlGenerator;
@property (nonatomic, strong) CustomURLSession *urlSession;
@property (nonatomic, strong) id<SessionManager> sessionManager;
@end

@implementation DefaultPaymentApi

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<PaymentApiURLGenerator>) urlGenerator sessionManager:(id<SessionManager>)sessionManager{
    self = [super init];
    if (self) {
        self.urlSession = urlSession;
        self.urlGenerator = urlGenerator;
        self.sessionManager = sessionManager;
    }
    return self;
}

- (void) getPaymentsOnSuccess:( void ( ^ )( NSArray<Payment *> *) )onSuccess onFailure:(void (^)(ApiError *error))onFailure {
    NSURL *URL = [self.urlGenerator urlForPayments];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    request.HTTPMethod = @"GET";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self appendTokenToURLRequest:request];
    NSURLSessionTask *task = [self.urlSession dataTaskWithRequest:request onSuccess:^(NSData *data, NSURLResponse *response) {
        //TODO handle deserialise error
        BRObjectSerialization *serialisation = [Payments serialiser];
       Payments *payments = [NSJSONSerialization JSONObjectWithData:data deserializer:serialisation options:0 error:nil];
        NSArray<Payment *>* array = payments.data;
        onSuccess(array);
    } onFailure:onFailure];
    [task resume];
}

- (void) putPayment:(PayRequestModel *)payRequest OnSuccess:( void ( ^ )( void ) )onSuccess onFailure:(void (^)(ApiError *error))onFailure {
    NSURL *URL =  [self.urlGenerator urlForPayments];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    request.HTTPMethod = @"PUT";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //TODO handle serialise error
    NSData *data =  [NSJSONSerialization dataWithJSONObject:payRequest serializer:[PayRequestModel serialiser] options:0 error:nil];
    [request setHTTPBody:data];
    [self appendTokenToURLRequest:request];
   NSURLSessionTask *task = [self.urlSession dataTaskWithRequest:request onSuccess:^(NSData *data, NSURLResponse *response) {
        onSuccess();
    } onFailure:onFailure];
    [task resume];
}

- (void) appendTokenToURLRequest:(NSMutableURLRequest *)request
{
    Session *session = [self.sessionManager  retrieveSession];
    NSString *apiKey = [NSString stringWithFormat:@"bearer %@",session.token];
    [request setValue:apiKey forHTTPHeaderField:@"Authorization"];
}


@end
