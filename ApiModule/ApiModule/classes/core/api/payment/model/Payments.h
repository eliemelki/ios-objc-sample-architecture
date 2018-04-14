//
//  Payments.h
//  api
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Payment.h"


@interface Payments : NSObject

@property (nonatomic, strong, readonly) NSArray<Payment *> *data;


@end
