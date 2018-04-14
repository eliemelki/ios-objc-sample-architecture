//
//  DefaultPaymentRouter.m
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "DefaultPaymentRouter.h"
#import "PaymentsViewController.h"


@interface DefaultPaymentRouter()

@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, weak) UINavigationController *mainViewController;

@property (nonatomic, strong) id<PaymentFactory> factory;

@end

@implementation DefaultPaymentRouter


- (id) initWithFactory:(id<PaymentFactory>)factory {
    self = [super init];
    if (self) {
        self.storyboard = [UIStoryboard storyboardWithName:@"payment" bundle:[NSBundle bundleForClass:[self class]]];
    
        self.factory = factory;
        [self initialise];
    }
    return self;
}


- (void) initialise {
    PaymentsViewController *viewController = [self.mainViewController.viewControllers objectAtIndex:0];
    viewController.presenter = [self.factory paymentsPresenter];
    viewController.router = self;
}

- (UIViewController *)mainViewController {
    if (_mainViewController == nil) {
        _mainViewController = [self.storyboard instantiateInitialViewController];
    }
    return _mainViewController;
}

@end
