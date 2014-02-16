//
//  PickerController.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 10.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "PickerController.h"
#import "DTDatePickerPresenter.h"
#import "DTPickerViewPresenter.h"
#import "DTPickerDatasource.h"
#import "DTPickerPopoverController.h"
#import "UIPopoverController+DTPickerPresenterAdditions.h"

@interface PickerController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField * datePickerTextField;
@property (weak, nonatomic) IBOutlet UITextField * wheelPickerTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView_iPad;
@property (nonatomic, strong) NSArray * tableItems;
@property (nonatomic, strong) UIPopoverController  * popover;
@end

@implementation PickerController

static NSString * const iPadCell = @"iPadMenuCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup_iPhonePickers];

    [self.tableView_iPad registerClass:[UITableViewCell class] forCellReuseIdentifier:iPadCell];
    self.tableItems = @[@"Select date", @"Select from picker"];
}

- (void)setup_iPhonePickers
{
    // Date picker

    DTDatePickerPresenter * presenter = [self datePresenter];
    [self.datePickerTextField dt_setPresenter:presenter];

    // Wheel picker

    DTPickerViewPresenter * wheelPresenter = [self pickerPresenter];
    [self.wheelPickerTextField dt_setPresenter:wheelPresenter];
}

-(DTDatePickerPresenter *)datePresenter
{
    __weak typeof (self) weakSelf = self;
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
        weakSelf.datePickerTextField.text = [selectedDate description];
    }];
    return presenter;
}

-(DTPickerViewPresenter *)pickerPresenter
{
    DTPickerDataSource * datasource = [DTPickerDataSource datasourceWithItems:@[@[@"foo", @"bar", @"cat"], @[@"OMG!", @"WTF!"]]];

    __weak typeof (self) weakSelf = self;
    DTPickerChangeBlock block = ^(NSArray * selectedComponents, NSIndexPath * selectedIndexPath, BOOL wasCancelled) {
        weakSelf.wheelPickerTextField.text = [selectedComponents.firstObject stringByAppendingFormat:@" - %@", selectedComponents.lastObject];
    };
    DTPickerViewPresenter * wheelPresenter = [DTPickerViewPresenter presenterWithDatasource:datasource
                                                                                changeBlock:block];
    return wheelPresenter;
}

#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView :(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.tableView_iPad dequeueReusableCellWithIdentifier:iPadCell forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.tableItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            DTDatePickerPresenter * presenter = [self datePresenter];
            self.popover = [UIPopoverController dt_popoverWithPresenter:presenter];
            break;
        }
        case 1:
        {
            DTPickerViewPresenter * presenter = [self pickerPresenter];
            self.popover = [UIPopoverController dt_popoverWithPresenter:presenter];
        }
            
            break;
        default:
            break;
    }
    [self.popover presentPopoverFromRect:[tableView cellForRowAtIndexPath:indexPath].frame
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
}

@end
