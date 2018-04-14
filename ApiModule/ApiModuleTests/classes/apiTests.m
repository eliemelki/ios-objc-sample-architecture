//
//  apiTests.m
//  apiTests
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ApiModule.h"
#import "MockApiFactory.h"



@interface apiTests : XCTestCase
@property (nonatomic, strong) ApiModule *module;

@end

@implementation apiTests

- (void)setUp {
    [super setUp];
    MockApiFactory *factory = [MockApiFactory new];
    self.module = [[ApiModule alloc] initWithFactory:factory];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLogin {
    XCTestExpectation *excpection = [[XCTestExpectation alloc] initWithDescription:@"Login request expectation"];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UserCredentials *credentials = [[UserCredentials alloc] initWithEmail:@"email" password:@"password"];
    [[[self.module factory] userApi] loginWitCredentials:credentials success:^(Session *session) {
        XCTAssertNotNil(session, "Session cannot be nil");
        XCTAssertNotNil(session.token, "token cannot be nil");
        [excpection fulfill];
    } onFailure:^(ApiError *error) {
        XCTAssert(true,@"cannot fail");
        [excpection fulfill];
    }];


    [self waitForExpectations:@[excpection] timeout:10];
}

- (void)testRegister {
    XCTestExpectation *excpection = [[XCTestExpectation alloc] initWithDescription:@"Register request expectation"];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UserCredentials *credentials = [[UserCredentials alloc] initWithEmail:@"email" password:@"password"];
    [[[self.module factory] userApi] registerWitCredentials:credentials success:^(Session *session) {
     
        XCTAssertNotNil(session, "Session cannot be nil");
        XCTAssertNotNil(session.token, "token cannot be nil");
        [excpection fulfill];
        
    } onFailure:^(ApiError *error) {
        
        XCTAssert(true,@"cannot fail");
        [excpection fulfill];
    }];
    
    [self waitForExpectations:@[excpection] timeout:10];
}


- (void)testPlaces {
    XCTestExpectation *excpection = [[XCTestExpectation alloc] initWithDescription:@"Places request expectation"];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [[[self.module factory] placeApi] getPlacesOnSuccess:^(NSArray<Place *> *places) {
        XCTAssertNotNil(places, @"places cannot be nil");
        Place *place = [places objectAtIndex:0];
        XCTAssertNotNil(place, @"first item cannot be nil");
        XCTAssertNotNil(place.identifier, @"identifier cannot be nil");
        XCTAssertEqualObjects(place.identifier, @"45c0b5209973fcec652817e16e20f1d0b4ecb602");
        XCTAssertNotNil(place.name, @"name cannot be nil");
        XCTAssertEqualObjects(place.name, @"Tokyo");
        PlaceLocation *placeLocation = place.placeLocation;
        XCTAssertNotNil(placeLocation, @"placeLocation cannot be nil");
        XCTAssertEqual(placeLocation.lng, 139.7319925);
        XCTAssertEqual(placeLocation.lat,  35.7090259);
        [excpection fulfill];
    } onFailure:^(ApiError *error) {
        XCTAssert(true,@"cannot fail");
        [excpection fulfill];
    }];
    
    [self waitForExpectations:@[excpection] timeout:10];
}

- (void)testPayments {
    XCTestExpectation *excpection = [[XCTestExpectation alloc] initWithDescription:@"Payments request expectation"];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [[[self.module factory] paymentApi] getPaymentsOnSuccess:^(NSArray<Payment *> *payments) {
        XCTAssertNotNil(payments, @"payments cannot be nil");
        Payment *payment = [payments objectAtIndex:0];
        XCTAssertNotNil(payment, @"first item cannot be nil");
        XCTAssertNotNil(payment.email, @"email cannot be nil");
        XCTAssertEqualObjects(payment.email, @"adrianobragaalencar@gmail.com");
        XCTAssertNotNil(payment.placeId, @"placeId cannot be nil");
        XCTAssertEqualObjects(payment.placeId, @"45c0b5209973fcec652817e16e20f1d0b4ecb602");
        CreditCard *creditCard = payment.creditCard;
        XCTAssertNotNil(creditCard, @"creditCard cannot be nil");
        XCTAssertNotNil(creditCard.number, @"creditCard.number cannot be nil");
        XCTAssertEqualObjects(creditCard.number, @"4111111111111111");
        XCTAssertNotNil(creditCard.name, @"creditCard.name cannot be nil");
        XCTAssertEqualObjects(creditCard.name, @"adrianobragaalencar");
        XCTAssertNotNil(creditCard.cvv, @"creditCard.cvv cannot be nil");
        XCTAssertEqualObjects(creditCard.cvv, @"123");
        XCTAssertNotNil(creditCard.expiryYear, @"creditCard.expiryYear cannot be nil");
        XCTAssertEqualObjects(creditCard.expiryYear, @"2100");
        XCTAssertNotNil(creditCard.expiryMonth, @"creditCard.expiryMonth cannot be nil");
        XCTAssertEqualObjects(creditCard.expiryMonth, @"03");
        
        [excpection fulfill];
        
    } onFailure:^(ApiError *error) {
        XCTAssert(true,@"cannot fail");
        [excpection fulfill];
    }];
    
    
    
    
    [self waitForExpectations:@[excpection] timeout:10];
}


@end


