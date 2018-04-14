//
//  PayRequestModel.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PayRequestModel : NSObject

@property (nonatomic, strong) NSString *placeId;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *cvv;
@property (nonatomic, strong) NSString *expiryMonth;
@property (nonatomic, strong) NSString *expiryYear;


@end
