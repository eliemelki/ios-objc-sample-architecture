//
//  RegisterViewController.m
//  loginModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "RegisterViewController.h"
#import <UIModule/UIModule.h>

enum RegisterFormTag{
    EmailTag = 100,
    PasswordTag
};


@interface RegisterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet InputTableViewCell *emailCell;
@property (weak, nonatomic) IBOutlet InputTableViewCell *passwordCell;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    [self.presenter setView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LoginView

- (void) hideEmailValidationError {
    self.emailCell.inputView.errorLabel.text = @"";
    [self reloadCell:self.emailCell];
}

- (void) hidePasswordValidationError {
    self.passwordCell.inputView.errorLabel.text = @"";
    [self reloadCell:self.emailCell];
}

- (void)showEmailValidationError:(NSString *)text {
    self.emailCell.inputView.errorLabel.text = text;
    [self reloadCell:self.emailCell];
}

- (void)showPasswordValidationError:(NSString *)text {
    self.passwordCell.inputView.errorLabel.text = text;
    [self reloadCell:self.passwordCell];
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

- (void) loginComplete:(Session *)session {
    [self.router loginCompleteWithSession:session];
}

#pragma mark - Private

- (void) configureUI {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    UITextField  *emailTextView =  self.emailCell.inputView.inputTextField;
    [emailTextView setReturnKeyType:UIReturnKeyNext];
    [emailTextView setTextContentType:UITextContentTypeEmailAddress];
    [emailTextView setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextView setTag:EmailTag];
    [emailTextView setDelegate:self];
    
    UITextField  *passwordTextView =  self.passwordCell.inputView.inputTextField;
    [passwordTextView setReturnKeyType:UIReturnKeyDone];
    [passwordTextView setTextContentType:UITextContentTypePassword];
    [passwordTextView setSecureTextEntry:YES];
    [passwordTextView setTag:PasswordTag];
    [passwordTextView setDelegate:self];
    
}

- (void) reloadCell:(UITableViewCell *)cell {
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == EmailTag) {
        [self.passwordCell.inputView.inputTextField becomeFirstResponder];
        [self.presenter validateEmail:textField.text];
    }else if (textField.tag == PasswordTag) {
        if ([self.presenter validatePassword:textField.text]) {
            [self.presenter submit:self.emailCell.inputView.inputTextField.text password:self.passwordCell.inputView.inputTextField.text];
        }
    }
    return NO;
}

#pragma mark - Actions

- (IBAction)didTapRegister:(id)sender {
    [self.presenter submit:self.emailCell.inputView.inputTextField.text password:self.passwordCell.inputView.inputTextField.text];
}



@end
