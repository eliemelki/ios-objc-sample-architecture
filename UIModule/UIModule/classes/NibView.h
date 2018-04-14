//
//  NibView.h
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NibView : UIView

@property (nonatomic, strong) IBOutlet UIView *contentView;

- (void) setupXib;

@end
