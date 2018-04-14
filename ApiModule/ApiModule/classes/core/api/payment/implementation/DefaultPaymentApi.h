//
//  DefaultPaymentApi.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentApi.h"
#import "CustomURLSession.h"
#import "PaymentApiURLGenerator.h"
#import "SessionManager.h"


@interface DefaultPaymentApi : NSObject<PaymentApi>

- (id) initWithURLSession:(CustomURLSession *)urlSession urlGenerator:(id<PaymentApiURLGenerator>) urlGenerator sessionManager:(id<SessionManager>)sessionManager;


@end
