//
// Created by Denys Telezhkin on 16.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIPopoverController (DTPickerPresenterAdditions)

+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter ofSize:(CGSize)size;

+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter;

- (id)dt_presenter;

@end