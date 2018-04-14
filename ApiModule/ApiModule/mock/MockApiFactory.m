//
//  MockApiFactory.m
//  apiTests
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "MockApiFactory.h"


#import "DefaultUserApiURLGenerator.h"
#import "DefaultPaymentApiURLGenerator.h"
#import "DefaultPlaceApiURLGenerator.h"
#import "DefaultUserApi.h"
#import "DefaultPaymentApi.h"
#import "DefaultPlaceApi.h"
#import "DefaultSessionManager.h"
#import "DefaultErrorResolver.h"

@interface MockPaymentApiURLGenerator : NSObject<PaymentApiURLGenerator>

@end

@interface MockPlaceApiURLGenerator : NSObject<PlaceApiURLGenerator>

@end

@interface MockUserApiURLGenerator : NSObject<UserApiURLGenerator>

@end


@interface MockApiFactory()

@property (nonatomic, strong) id<SessionManager> sessionManager;
@property (nonatomic, strong) CustomURLSession *urlSession;

@end

@implementation MockApiFactory

- (id) init {
    self = [super init];
    if (self) {
        
        self.sessionManager = [DefaultSessionManager new];
        self.urlSession = [[CustomURLSession alloc] initWithErrorResolver:[self errorResolver]];;
    }
    return self;
}

- (id<UserApiURLGenerator>) userApiUrlGenerator {
    return [MockUserApiURLGenerator new];
}

- (id<PaymentApiURLGenerator>) paymentApiUrlGenerator {
      return [MockPaymentApiURLGenerator new];
}

- (id<PlaceApiURLGenerator>) placeApiUrlGenerator {
    return [MockPlaceApiURLGenerator new];
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


@implementation MockPaymentApiURLGenerator

- (NSURL *) urlForPayments {
   return  [[NSBundle bundleForClass:[self class]]  URLForResource:@"payments" withExtension:@"json"];
}

- (NSURL *) urlForPutPayments {
  return  [[NSBundle bundleForClass:[self class]]  URLForResource:@"put_payment" withExtension:@"json"];
}

@end

@implementation MockPlaceApiURLGenerator

- (NSURL *) urlForPlaces {
    return [[NSBundle bundleForClass:[self class]] URLForResource:@"places" withExtension:@"json"];
}

@end

@implementation MockUserApiURLGenerator

- (NSURL *) urlForUsers {
    return  [[NSBundle bundleForClass:[self class]]  URLForResource:@"user" withExtension:@"json"];
}

@end
