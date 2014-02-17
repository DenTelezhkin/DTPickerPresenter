//
//  UITextField+DTPickerPresenterAdditions.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "UITextField+DTPickerPresenterAdditions.h"
#import "DTDatePickerPresenter.h"
#import "DTPickerViewPresenter.h"
#import <objc/runtime.h>

@implementation UITextField (DTPickerPresenterAdditions)

- (void)dt_setPresenter:(id)presenter
{
    BOOL datePicker = [presenter isKindOfClass:[DTDatePickerPresenter class]];
    BOOL picker = [presenter isKindOfClass:[DTPickerViewPresenter class]];

    NSAssert(datePicker || picker, @"Picker presenter should be either DTDatePickerPresenter or DTPickerViewPresenter");

    objc_setAssociatedObject(self, @selector(dt_presenter), presenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (datePicker) {
        self.inputView = [(DTDatePickerPresenter * )presenter datePicker];
    }
    else if (picker) {
        self.inputView = [(DTPickerViewPresenter * )presenter pickerView];
    }
}

- (id)dt_presenter
{
    return objc_getAssociatedObject(self, @selector(dt_presenter));
}

@end
