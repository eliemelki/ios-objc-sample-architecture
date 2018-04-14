//
//  AppDelegate.m
//  app
//
//  Created by Elie Melki on 10/02/18.
//  Copyright © 2018 Random. All rights reserved.
//

#import "AppDelegate.h"
#import <LoginModule/LoginModule.h>
#import <PaymentModule/PaymentModule.h>
#import <PlaceModule/PlaceModule.h>


@interface AppDelegate () <LoginRouterDelegate>

@property (nonatomic, strong) ApiModule *apiModule;
@property (nonatomic, strong) LoginModule *loginModule;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   
    //We need to retain the api module, so the Session is retained through the SessionManager across app life cycle.
    self.apiModule = [[ApiModule alloc] initWithFactory:[MockApiFactory new]];
    
    self.loginModule = [[LoginModule alloc] initWithApiModule:self.apiModule];
    id<LoginRouter> router = [self.loginModule.factory router];
    router.delegate = self;
    [router launchAsRoot];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)didCompleteLogin:(Session *)session {
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    
    PlaceModule *placeModule = [[PlaceModule alloc] initWithApiModule:self.apiModule];
    UIViewController *placesViewController = [[placeModule.factory router] mainViewController];
    placesViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Places" image:nil tag:1];
    [tabViewControllers addObject:placesViewController];
    
    PaymentModule *paymentModule = [[PaymentModule alloc] initWithApiModule:self.apiModule];
    UIViewController *paymentViewController = [[paymentModule.factory router] mainViewController];
    paymentViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Payments" image:nil tag:1];
    [tabViewControllers addObject:paymentViewController];
    
   
  
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = tabViewControllers;
    
    self.window.rootViewController = tabBarController;
}

@end
