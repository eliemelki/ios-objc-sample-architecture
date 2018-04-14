//
//  InputTableViewCell.h
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputView.h"


@interface InputTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet InputView *inputView;
@end
