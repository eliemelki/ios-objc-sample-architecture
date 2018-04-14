//
//  ApiConfiguration.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>

//ApiConfiguration Model object that include information around the server URL
@interface ApiConfiguration : NSObject

@property (nonatomic, strong, readonly) NSURL *apiURL;

- (id) initWithURL:(NSURL *)url;

@end
