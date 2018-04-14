//
//  CreditCard.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CreditCard : NSObject

@property (nonatomic, strong, readonly) NSString *number;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *cvv;
@property (nonatomic, strong, readonly) NSString *expiryMonth;
@property (nonatomic, strong, readonly) NSString *expiryYear;



@end




