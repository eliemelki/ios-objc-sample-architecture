//
//  PaymentsViewController.m
//  PaymentModule
//
//  Created by Elie Melki on 11/02/18.
//  Copyright © 2018 Eli. All rights reserved.
//

#import "PaymentsViewController.h"
#import <UIModule/UIModule.h>

@interface PaymentsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditCardLabel;

@end

@interface PaymentsViewController()

@property (nonatomic, strong) NSArray<PaymentViewModel *> *data;

@end

@implementation PaymentsViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    [self.presenter setView:self];
    
}

#pragma mark - PaymentsView
- (void) showPayments:(NSArray<PaymentViewModel *> *)payments {
    self.data = payments;
    [self.tableView reloadData];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter refreshData];
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

#pragma mark - UITableViewDataSource

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PaymentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PaymentsTableViewCell class])];
    PaymentViewModel *viewModel = [self.data objectAtIndex:indexPath.row];
    cell.creditCardLabel.text = viewModel.creditCardNumber;
    cell.placeLabel.text = viewModel.placeName;
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return cell;
}

#pragma mark - Private

- (void) configureUI {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
}

@end

@implementation PaymentsTableViewCell

@end
