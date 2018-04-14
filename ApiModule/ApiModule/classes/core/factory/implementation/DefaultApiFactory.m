//
//  DefaultApiFactory.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultApiFactory.h"
#import "DefaultUserApiURLGenerator.h"
#import "DefaultPaymentApiURLGenerator.h"
#import "DefaultPlaceApiURLGenerator.h"
#import "DefaultUserApi.h"
#import "DefaultPaymentApi.h"
#import "DefaultPlaceApi.h"
#import "DefaultSessionManager.h"
#import "DefaultErrorResolver.h"

@interface DefaultApiFactory()

@property (nonatomic, strong) ApiConfiguration *configuration;
@property (nonatomic, strong) id<SessionManager> sessionManager;
@property (nonatomic, strong) CustomURLSession *urlSession;
@end

@implementation DefaultApiFactory

- (id) initWithApiConfiguration:(ApiConfiguration *)configuration {
    self = [super init];
    if (self) {
        self.configuration = configuration;
        self.sessionManager = [DefaultSessionManager new];
        self.urlSession = [[CustomURLSession alloc] initWithErrorResolver:[self errorResolver]];;
    }
    return self;
}

- (id<UserApiURLGenerator>) userApiUrlGenerator {
    return [[DefaultUserApiURLGenerator alloc] initWithURLGenerator:self.configuration];
}

- (id<PaymentApiURLGenerator>) paymentApiUrlGenerator {
    return [[DefaultPaymentApiURLGenerator alloc] initWithURLGenerator:self.configuration];
}

- (id<PlaceApiURLGenerator>) placeApiUrlGenerator {
    return [[DefaultPlaceApiURLGenerator alloc] initWithURLGenerator:self.configuration];
}

- (id<SessionManager>) sessionManager {
    return _sessionManager;
}

- (id<ApiErrorResolver>) errorResolver {
    return [DefaultErrorResolver new];
}

- (id<UserApi>) userApi {
    return [[DefaultUserApi alloc] initWithURLSession:[self urlSession] urlGenerator:[self userApiUrlGenerator] sessionManager:[self sessionManager]];
}

- (id<PlaceApi>) placeApi {
    return [[DefaultPlaceApi alloc] initWithURLSession:[self urlSession] urlGenerator:[self placeApiUrlGenerator] sessionManager:[self sessionManager]];
}

- (id<PaymentApi>) paymentApi {
    return [[DefaultPaymentApi alloc] initWithURLSession:[self urlSession] urlGenerator:[self paymentApiUrlGenerator] sessionManager:[self sessionManager]];
}

@end
