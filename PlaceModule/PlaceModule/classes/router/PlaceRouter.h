//
//  PlaceRouter.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <ApiModule/ApiModule.h>


@protocol PlaceRouter <NSObject>

//Return the container view controller of payment module
- (UIViewController *) mainViewController;

//navigate to rent a bicycle feature
- (void) navigateToRentPlace:(Place *)place;

//navigate to the mainViewController
- (void) navigateToMain;

@end
