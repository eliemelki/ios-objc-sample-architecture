//
//  UIView+Loading.m
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "UIView+Loading.h"
#import "LoadingView.h"

enum {
    LoadingViewTag = 443
};

@implementation UIView (Loading)

- (void) showLoading {
    LoadingView *loadingView = [self viewWithTag:LoadingViewTag];
    if (loadingView == nil) {
        loadingView = [[LoadingView alloc] init];
        [loadingView setTag:LoadingViewTag];
        [loadingView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:loadingView];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[loadingView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(loadingView)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[loadingView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(loadingView)]];
        
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void) hideLoading {
    LoadingView *loadingView = [self viewWithTag:LoadingViewTag];
    [loadingView removeFromSuperview];
}
@end

