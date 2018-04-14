//
//  PaymentsViewController.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentContract.h"
#import "PaymentRouter.h"

@interface PaymentsViewController : UITableViewController<PaymentsView>

@property (nonatomic, strong) id<PaymentsPresenter> presenter;
@property (nonatomic, strong) id<PaymentRouter> router;

@end
