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

-(void)dt_setPickerPresenter:(id)presenter
{
    BOOL datePicker = [presenter isKindOfClass:[DTDatePickerPresenter class]];
    BOOL picker = [presenter isKindOfClass:[DTPickerViewPresenter class]];
    
    NSAssert(datePicker || picker, @"Picker presenter should be either DTDatePickerPresenter or DTPickerViewPresenter");
    
    objc_setAssociatedObject(self, @selector(dt_presenter), presenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if ([presenter isKindOfClass:[DTDatePickerPresenter class]])
    {
        [self dt_setDatePickerPresenter:presenter];
    }
    else if ([presenter isKindOfClass:[DTPickerViewPresenter class]])
    {
        [self dt_setPickerViewPresenter:presenter];
    }
}

-(id)dt_presenter
{
    return objc_getAssociatedObject(self, @selector(dt_presenter));
}

-(void)dt_setDatePickerPresenter:(DTDatePickerPresenter *)presenter
{
    NSAssert(presenter.selectBlock, @"DTDatePickerPresenter should have non nil select block");
    self.inputView = presenter.datePicker;
}

-(void)dt_setPickerViewPresenter:(DTPickerViewPresenter *)presenter
{
    self.inputView = presenter.pickerView;
}

@end
