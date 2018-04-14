//
//  DefaultLoginRouter.m
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultLoginRouter.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface DefaultLoginRouter()

@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, weak) UINavigationController *mainViewController;

@property (nonatomic, strong) id<LoginFactory> factory;

@end

@implementation DefaultLoginRouter

@synthesize delegate;

- (id) initWithFactory:(id<LoginFactory>)factory {
    self = [super init];
    if (self) {
        self.storyboard = [UIStoryboard storyboardWithName:@"login" bundle:[NSBundle bundleForClass:[self class]]];
        
        self.factory = factory;
    }
    return self;
}

- (void) launchAsRoot {
    self.mainViewController = [self.storyboard instantiateInitialViewController];
    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [[UIApplication sharedApplication] delegate].window = window;
    LoginViewController *loginViewController = [self.mainViewController.viewControllers objectAtIndex:0];
    loginViewController.presenter = [self.factory loginPresenter];
    loginViewController.router = self;
    window.rootViewController = self.mainViewController;
    [window makeKeyAndVisible];
    
}

- (void) goToRegister {
    RegisterViewController *registerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    registerViewController.presenter = [self.factory registerPresenter];
    registerViewController.router = self;
    [self.mainViewController pushViewController:registerViewController animated:YES];
}

- (void) loginCompleteWithSession:(Session *)session {
    [self.delegate didCompleteLogin:session];
}

- (void) dealloc {
    
}

@end
