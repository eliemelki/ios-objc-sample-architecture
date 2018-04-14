//
//  ApiError.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface ApiError : NSObject

@property (nonatomic, readonly) int code;
@property (nonatomic, strong, readonly) NSString *message;

- (id) initWithCode:(int)code message:(NSString *)message;



@end
