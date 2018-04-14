//
//  PaymentsPresenter.m
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentsPresenter.h"


@interface PaymentsPresenter()

@property (nonatomic, strong) id<PaymentApi> paymentApi;
@property (nonatomic, strong) id<PlaceApi> placeApi;
@property (nonatomic, weak) id<PaymentsView> view;
@end

@implementation PaymentsPresenter


- (id) initWithApi:(id<PaymentApi>) paymentApi placeApi:(id<PlaceApi>)placeApi {
    self = [super init];
    if (self) {
        self.paymentApi = paymentApi;
        self.placeApi = placeApi;
    }
    return self;
}

#pragma mark - Presenter

- (void) setView:(id<PaymentsView>)view {
    _view = view;
 
}

- (void)refreshData {
    [self.view showLoading];
    [self.paymentApi getPaymentsOnSuccess:^(NSArray<Payment *> *payments) {
        [self.placeApi getPlacesOnSuccess:^(NSArray<Place *> *places) {
            NSArray<PaymentViewModel *> *data = [self combinePlaces:places payments:payments];
            [self.view showPayments:data];
            [self.view hideLoading];
        } onFailure:^(ApiError *error) {
            [self.view hideLoading];
            [self.view showLoginError:error.message];
        }];
    } onFailure:^(ApiError *error) {
        [self.view hideLoading];
        [self.view showLoginError:error.message];
    }];
}


#pragma mark - Private

- (NSArray<PaymentViewModel *> *)combinePlaces:(NSArray *)places payments:(NSArray *)payments {
    NSMutableArray *result = [NSMutableArray array];
    for (Payment *payment in payments) {
        Place *place = [self findMatchingPlaceForPayment:payment inPlaces:places];
        if (place != nil) {
            PaymentViewModel *viewModel = [[PaymentViewModel alloc] initWithPayment:payment place:place];
            [result addObject:viewModel];
        }
    }
    return result;
}

- (Place *) findMatchingPlaceForPayment:(Payment *)payment inPlaces:(NSArray *)places {
    for (Place *place in places) {
        if ([place.identifier isEqualToString:payment.placeId]) {
            return place;
        }
    }
    return nil;
}

@end
