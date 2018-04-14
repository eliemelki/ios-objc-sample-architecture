//
//  RentPlaceViewController.m
//  PlaceModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "RentPlaceViewController.h"
#import <UIModule/UIModule.h>


@interface RentPlaceViewController() <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet InputTableViewCell *cardNumberCell;
@property (weak, nonatomic) IBOutlet InputTableViewCell *cardCVVCell;
@property (weak, nonatomic) IBOutlet InputTableViewCell *expiryMonthCell;
@property (weak, nonatomic) IBOutlet InputTableViewCell *expiryYearCell;
@property (weak, nonatomic) IBOutlet InputTableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end


enum RentPlaceTag {
    CardNumber = 100,
    CardCVV,
    CardMonth,
    CardYear,
    CardName
};


@implementation RentPlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    [self.presenter setView:self ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LoginView

- (void) showPlace:(NSString *)place {
    self.placeLabel.text = place;
}

- (void)showLoginError:(NSString *)text {
    [self showError:text];
}

- (void) showLoading {
    [self.view.window showLoading];
}

- (void) hideLoading {
    [self.view.window hideLoading];
}

- (PayRequestModel *)payRequestModelFromUI { 
    PayRequestModel *model = [PayRequestModel new];
    model.number = self.cardNumberCell.inputView.inputTextField.text;
    model.cvv = self.cardCVVCell.inputView.inputTextField.text;
    model.expiryMonth = self.expiryMonthCell.inputView.inputTextField.text;
    model.expiryYear = self.expiryYearCell.inputView.inputTextField.text;
    model.name = self.nameCell.inputView.inputTextField.text;
    return model;
}

- (void)paymentComplete { 
    [self.router navigateToMain];
}


- (void)showCreditCardCVValidationError:(NSString *)text {
    self.cardCVVCell.inputView.errorLabel.text = text;
    [self reloadCell:self.cardCVVCell];
}


- (void)showCreditCardExpiryMonthValidationError:(NSString *)text {
    self.expiryMonthCell.inputView.errorLabel.text = text;
    [self reloadCell:self.expiryMonthCell];
}


- (void)showCreditCardExpiryYearValidationError:(NSString *)text {
    self.expiryYearCell.inputView.errorLabel.text = text;
    [self reloadCell:self.expiryYearCell];
}


- (void)showCreditCardNameValidationError:(NSString *)text {
    self.cardNumberCell.inputView.errorLabel.text = text;
    [self reloadCell:self.cardNumberCell];
}


- (void)showCreditCardNumberValidationError:(NSString *)text { 
    self.cardNumberCell.inputView.errorLabel.text = text;
    [self reloadCell:self.cardNumberCell];
}

- (void)hideCreditCardCVValidationError {
    [self showCreditCardCVValidationError:@""];
}


- (void)hideCreditCardExpiryMonthValidationError {
    [self showCreditCardExpiryMonthValidationError:@""];
}


- (void)hideCreditCardExpiryYearValidationError {
    [self showCreditCardExpiryYearValidationError:@""];
}


- (void)hideCreditCardNameValidationError {
    [self showCreditCardNumberValidationError:@""];
}


- (void)hideCreditCardNumberValidationError {
    [self showCreditCardNumberValidationError:@""];
}


#pragma mark - Private

- (void) configureUI {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    UITextField  *cardNumberView =  self.cardNumberCell.inputView.inputTextField;
    [cardNumberView setReturnKeyType:UIReturnKeyNext];
    [cardNumberView setTextContentType:UITextContentTypeCreditCardNumber];
    [cardNumberView setKeyboardType:UIKeyboardTypeNumberPad];
    [cardNumberView setTag:CardNumber];
    [cardNumberView setDelegate:self];
    
    UITextField  *cardCVVView =  self.cardCVVCell.inputView.inputTextField;
    [cardCVVView setReturnKeyType:UIReturnKeyNext];
    [cardCVVView setKeyboardType:UIKeyboardTypeNumberPad];
    [cardCVVView setTag:CardCVV];
    [cardCVVView setDelegate:self];
    
    
    UITextField  *expiryMonthView =  self.expiryMonthCell.inputView.inputTextField;
    [expiryMonthView setReturnKeyType:UIReturnKeyNext];
    [expiryMonthView setKeyboardType:UIKeyboardTypeNumberPad];
    [expiryMonthView setTag:CardMonth];
    [expiryMonthView setDelegate:self];
    
    
    UITextField  *expiryYearView =  self.expiryYearCell.inputView.inputTextField;
    [expiryYearView setReturnKeyType:UIReturnKeyNext];
    [expiryYearView setKeyboardType:UIKeyboardTypeNumberPad];
    [expiryYearView setTag:CardYear];
    [expiryYearView setDelegate:self];
    
    
    UITextField  *nameView =  self.nameCell.inputView.inputTextField;
    [nameView setReturnKeyType:UIReturnKeyDone];
    [nameView setTag:CardName];
    [nameView setDelegate:self];
    
}

- (void) reloadCell:(UITableViewCell *)cell {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    });
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == CardCVV) {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSInteger length = [currentString length];
        if (length > 3) {
            return NO;
        }
    }
    else if (textField.tag == CardMonth) {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSInteger length = [currentString length];
        if (length > 2) {
            return NO;
        }
    }else  if (textField.tag == CardYear) {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSInteger length = [currentString length];
        if (length > 4) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == CardNumber) {
        [self.cardCVVCell.inputView.inputTextField becomeFirstResponder];
        [self.presenter validateCreditCardNumber:textField.text];
    }else if (textField.tag == CardCVV) {
        [self.expiryMonthCell.inputView.inputTextField becomeFirstResponder];
        [self.presenter validateCreditCardCVV:textField.text];
    }else if (textField.tag == CardMonth) {
        [self.expiryYearCell.inputView.inputTextField becomeFirstResponder];
        [self.presenter validateCreditCardExpiryMonth:textField.text];
    }else if (textField.tag == CardYear) {
        [self.nameCell.inputView.inputTextField becomeFirstResponder];
        [self.presenter validateCreditCardExpiryYear:textField.text];
    } else if (textField.tag == CardName) {
        if ([self.presenter validateCreditCardName:textField.text]) {
            [self.presenter submit];
        }
    }
    return NO;
}


#pragma mark - Actions

- (IBAction)didTapPay:(id)sender {
    [self.presenter submit];
}




@end
