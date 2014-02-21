//
// Created by Denys Telezhkin on 16.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIPopoverController+DTPickerPresenter.h"
#import "DTDatePickerPresenter.h"
#import "DTPickerViewPresenter.h"
#import <objc/runtime.h>

@implementation UIPopoverController (DTPickerPresenter)

+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter
{
    return [self dt_popoverWithPresenter:presenter ofSize:CGSizeMake(320, 216)];
}

+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter ofSize:(CGSize)size
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