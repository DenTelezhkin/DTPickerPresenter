//
//  PickerController.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 10.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "PickerController.h"
#import "DTDatePickerPresenter.h"

@interface PickerController ()
@property (weak, nonatomic) IBOutlet UITextField *datePickerTextField;

@end

@implementation PickerController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof (self) weakSelf = self;
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate *selectedDate) {
        weakSelf.datePickerTextField.text = [selectedDate description];
    }];
    
    [self.datePickerTextField dt_setPickerPresenter:presenter];
}


@end
