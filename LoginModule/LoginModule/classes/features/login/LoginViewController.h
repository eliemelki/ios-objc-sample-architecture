//
//  LoginViewController.h
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginContract.h"
#import "LoginRouter.h"

@interface LoginViewController : UITableViewController<LoginView>

@property (nonatomic, strong) id<LoginPresenter> presenter;
@property (nonatomic, strong) id<LoginRouter> router;

@end
