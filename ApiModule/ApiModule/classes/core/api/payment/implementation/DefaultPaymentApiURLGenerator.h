//
//  DefaultPaymentApiURLGenerator.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentApiURLGenerator.h"
#import "ApiConfiguration.h"

@interface DefaultPaymentApiURLGenerator : NSObject<PaymentApiURLGenerator>

- (id) initWithURLGenerator:(ApiConfiguration *)apiConfiguration;

@end
