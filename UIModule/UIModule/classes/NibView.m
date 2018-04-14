//
//  NibView.m
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "NibView.h"

@implementation NibView


- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupXib];
    }
    return self;
}


- (void) setupXib {
    Class clazz = [self class];
    NSString *nibName = NSStringFromClass(clazz);
    NSBundle *bundle = [NSBundle bundleForClass:clazz];
    UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
    _contentView = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
    [_contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_contentView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
   
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
    
}

#ifdef TARGET_INTERFACE_BUILDER
- (void) prepareForInterfaceBuilder {
    [self setupXib];
}
#endif


@end
