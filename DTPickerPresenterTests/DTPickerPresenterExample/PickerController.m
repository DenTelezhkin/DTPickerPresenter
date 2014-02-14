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

@interface PickerController ()
@property (weak, nonatomic) IBOutlet UITextField * datePickerTextField;
@property (weak, nonatomic) IBOutlet UITextField * wheelPickerTextfield;
@end

@implementation PickerController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Date picker

    __weak typeof (self) weakSelf = self;
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate)
        {
            weakSelf.datePickerTextField.text = [selectedDate description];
        }];

    [self.datePickerTextField dt_setPresenter:presenter];

    // Wheel picker

    DTPickerDataSource * datasource = [DTPickerDataSource datasourceWithItems:@[@[@"foo", @"bar", @"cat"], @[@"OMG!", @"WTF!"]]];

    DTPickerChangeBlock block = ^(NSArray * selectedComponents, NSIndexPath * selectedIndexPath, BOOL wasCancelled)
        {
            weakSelf.wheelPickerTextfield.text = [selectedComponents.firstObject stringByAppendingFormat:@" - %@", selectedComponents.lastObject];
        };
    DTPickerViewPresenter * wheelPresenter = [DTPickerViewPresenter presenterWithDatasource:datasource
                                                                                changeBlock:block];
    [self.wheelPickerTextfield dt_setPresenter:wheelPresenter];
}
@end
