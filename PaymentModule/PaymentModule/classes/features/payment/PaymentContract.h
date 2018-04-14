//
//  PaymentContract.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentViewModel.h"

@protocol PaymentsView <NSObject>

- (void) showPayments:(NSArray<PaymentViewModel *> *)payments;
- (void) showLoginError:(NSString *)text;
- (void) showLoading;
- (void) hideLoading;


@end

@protocol PaymentsPresenter <NSObject>

- (void) setView:(id<PaymentsView>)view;
- (void) refreshData;

@end
