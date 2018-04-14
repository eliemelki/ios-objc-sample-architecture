//
//  RentPlaceViewController.h
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RentPlaceContract.h"
#import "PlaceRouter.h"

@interface RentPlaceViewController : UITableViewController<RentPlaceView>

@property (nonatomic, strong) id<RentPlacePresenter> presenter;
@property (nonatomic, strong) id<PlaceRouter> router;


@end


