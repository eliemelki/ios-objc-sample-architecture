//
//  InputView.m
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "InputView.h"

@implementation InputView

- (void) setTitleText:(NSString *)titleText {
    _titleText = titleText;
    self.titleLabel.text = titleText;
}

- (void) setPlaceHolderText:(NSString *)placeHolderText {
    _placeHolderText = placeHolderText;
    self.inputTextField.placeholder = placeHolderText;
}

#ifdef TARGET_INTERFACE_BUILDER
- (void) prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    self.titleLabel.text = _titleText;
    self.inputTextField.placeholder = _placeHolderText;
    
}
#endif

@end
