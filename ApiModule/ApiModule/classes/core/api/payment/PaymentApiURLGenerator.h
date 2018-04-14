//
//  PaymentApiURLGenerator.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentApiURLGenerator <NSObject>

- (NSURL *) urlForPayments;
- (NSURL *) urlForPutPayments;
@end
