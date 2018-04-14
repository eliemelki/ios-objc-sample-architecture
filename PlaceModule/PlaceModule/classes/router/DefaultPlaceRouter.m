//
//  DefaultPlaceRouter.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultPlaceRouter.h"
#import "PlacesViewController.h"
#import "RentPlaceViewController.h"


@interface DefaultPlaceRouter()

@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, weak) UINavigationController *mainViewController;

@property (nonatomic, strong) id<PlaceFactory> factory;

@end

@implementation DefaultPlaceRouter


- (id) initWithFactory:(id<PlaceFactory>)factory {
    self = [super init];
    if (self) {
        self.storyboard = [UIStoryboard storyboardWithName:@"place" bundle:[NSBundle bundleForClass:[self class]]];
        self.factory = factory;
        [self initialise];
    }
    return self;
}


- (void) initialise {
    PlacesViewController *viewController = [self.mainViewController.viewControllers objectAtIndex:0];
    viewController.presenter = [self.factory placesPresenter];
    viewController.router = self;
}

- (UIViewController *)mainViewController {
    if (_mainViewController == nil) {
        _mainViewController = [self.storyboard instantiateInitialViewController];
    }
    return _mainViewController;
}

- (void)navigateToMain {
    [self.mainViewController popToRootViewControllerAnimated:YES];
}


- (void)navigateToRentPlace:(Place *)place {
    RentPlaceViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RentPlaceViewController"];
    viewController.presenter = [self.factory rentPlacePresenter];
    viewController.router = self;
    [viewController.presenter setPlace:place];
    [self.mainViewController pushViewController:viewController animated:YES];
}


@end
