//
//  PickerController.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 10.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "iPhonePickerController.h"
#import "DTPickerPresenter.h"

@interface iPhonePickerController () 
@property (weak, nonatomic) IBOutlet UITextField * datePickerTextField;
@property (weak, nonatomic) IBOutlet UITextField * wheelPickerTextField;
@end

@implementation iPhonePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Date picker
    
    __weak typeof (self) weakSelf = self;
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
        weakSelf.datePickerTextField.text = [selectedDate description];
    }];
    [self.datePickerTextField dt_setPresenter:presenter];
    
    // Wheel picker

    DTPickerDataSource * datasource = [DTPickerDataSource datasourceWithItems:@[@[@"foo", @"bar", @"cat"], @[@"OMG!", @"WTF!"]]];
    
    DTPickerChangeBlock block = ^(NSArray * selectedComponents, NSIndexPath * selectedIndexPath, BOOL wasCancelled) {
        weakSelf.wheelPickerTextField.text = [selectedComponents.firstObject stringByAppendingFormat:@" - %@", selectedComponents.lastObject];
    };
    DTPickerViewPresenter * wheelPresenter = [DTPickerViewPresenter presenterWithDatasource:datasource
                                                                                changeBlock:block];
    [self.wheelPickerTextField dt_setPresenter:wheelPresenter];
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self.datePickerTextField resignFirstResponder];
    [self.wheelPickerTextField resignFirstResponder];
}
@end
