//
//  DTDatePickerPresenter.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTDatePickerPresenter.h"

@implementation DTDatePickerPresenter

@synthesize datePicker = _datePicker;

+ (instancetype)presenterWithChangeBlock:(DTDatePickerChangeBlock)changeBlock
{
    DTDatePickerPresenter * presenter = [self new];

    presenter.changeBlock = changeBlock;

    return presenter;
}

- (void)dealloc
{
    [self.datePicker removeTarget:self action:NULL forControlEvents:UIControlEventValueChanged];
}

- (void)setDatePicker:(UIDatePicker *)newDatePicker
{
    NSParameterAssert([newDatePicker isKindOfClass:[UIDatePicker class]]);

    _datePicker = newDatePicker;
    [_datePicker addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [UIDatePicker new];
        [_datePicker addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

- (void)valueChanged:(UIDatePicker *)picker
{
    if (self.changeBlock) {
        self.changeBlock(self.datePicker.date);
    }
}

@end
