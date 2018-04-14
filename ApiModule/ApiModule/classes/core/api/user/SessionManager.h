//
//  SessionManager.h
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@protocol SessionManager <NSObject>

- (void) saveSession:(Session *)session;
- (Session *) retrieveSession;

@end
