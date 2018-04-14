//
//  DefaultSessionManager.m
//  api
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "DefaultSessionManager.h"

@interface DefaultSessionManager()

@property (nonatomic, strong) Session *session;

@end

@implementation DefaultSessionManager

- (void) saveSession:(Session *)session {
    self.session = session;
}
- (Session *) retrieveSession {
    return self.session;
}
@end
