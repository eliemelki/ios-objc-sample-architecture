//
//  InputTableViewCell.m
//  UIModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "InputTableViewCell.h"

@implementation InputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTitleText:(NSString *)titleText {
    self.inputView.titleText = titleText;
}

@end
