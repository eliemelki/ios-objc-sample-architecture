//
//  InputView.h
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NibView.h"

IB_DESIGNABLE
@interface InputView : NibView


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;


@property (nonatomic, assign) IBInspectable NSString *titleText;
@property (nonatomic, assign) IBInspectable NSString *placeHolderText;
@end
