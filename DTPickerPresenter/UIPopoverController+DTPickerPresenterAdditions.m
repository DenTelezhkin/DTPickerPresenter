//
// Created by Denys Telezhkin on 16.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "UIPopoverController+DTPickerPresenterAdditions.h"
#import "DTDatePickerPresenter.h"
#import "DTPickerViewPresenter.h"
#import <objc/runtime.h>

@implementation UIPopoverController (DTPickerPresenterAdditions)

+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter
{
    return [self dt_popoverWithPresenter:presenter ofSize:CGSizeMake(320, 216)];
}

+(UIPopoverController * )dt_popoverWithPresenter:(id)presenter ofSize:(CGSize)size
{
    UIViewController * controller = [UIViewController new];
    
    if ([presenter isKindOfClass:[DTDatePickerPresenter class]]) {
        [controller.view addSubview:[(DTDatePickerPresenter *)presenter datePicker]];
    }
    else if ([presenter isKindOfClass:[DTPickerViewPresenter class]]) {
        [controller.view addSubview:[(DTPickerViewPresenter *)presenter pickerView]];
    }
    
    UIPopoverController * popover = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    objc_setAssociatedObject(popover, @selector(dt_presenter), presenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [popover setPopoverContentSize:size];
    return popover;

}

- (id)dt_presenter
{
    return objc_getAssociatedObject(self, @selector(dt_presenter));
}

@end