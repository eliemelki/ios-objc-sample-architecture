//
//  Payment.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreditCard.h"


@interface Payment : NSObject

@property (nonatomic, strong, readonly) CreditCard *creditCard;
@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *placeId;


@end

