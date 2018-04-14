//
//  PaymentRouter.h
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PaymentRouter <NSObject>

//Return the container view controller of payment module
- (UIViewController *) mainViewController;

@end
