//
//  UserCredentials.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCredentials : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

- (id) initWithEmail:(NSString *)email password:(NSString *)password;


@end
