//
//  LoginModuleRouter.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ApiModule/ApiModule.h>

//LoginRouterDelagate is called whenever a login is complete and a session is obtained.
@protocol LoginRouterDelegate <NSObject>

- (void) didCompleteLogin:(Session *)session;

@end

//Login Router.
@protocol LoginRouter <NSObject>

//This method is intended to be called at first and launch the login feature UI.
//The default implementation add the UI to that main window rootViewController.
- (void) launchAsRoot;

//Call this method when you want to route to register view.
- (void) goToRegister;

//Upon complete login and obtaining a session, we call this method.
- (void) loginCompleteWithSession:(Session *)session;

@property (nonatomic, weak) id<LoginRouterDelegate> delegate;

@end
