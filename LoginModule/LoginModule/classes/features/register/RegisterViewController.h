//
//  RegisterViewController.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterContract.h"
#import "LoginRouter.h"

@interface RegisterViewController : UITableViewController<RegisterView>

@property (nonatomic, strong) id<RegisterPresenter> presenter;
@property (nonatomic, strong) id<LoginRouter> router;

@end
