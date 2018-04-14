//
//  PlacesViewController.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacesContract.h"
#import "PlaceRouter.h"

@interface PlacesViewController : UIViewController<PlacesView>

@property (nonatomic, strong) id<PlacesPresenter> presenter;
@property (nonatomic, strong) id<PlaceRouter> router;

@end
