//
// Created by Denys Telezhkin on 16.02.14.
// Copyright (c) 2014 MLSDev. All rights reserved.
//

/**
 This category allows easily create UIPopoverController instance with presenter to control UIPickerView or UIDatePicker object.
 */

@interface UIPopoverController (DTPickerPresenter)

/**
 Method to create UIPopoverController with UIPickerView(or UIDatePicker) of default size(320x216 points).
 
 @param presenter DTPickerViewPresenter or DTDatePickerPresenter instance to manage picker.
 
 @result UIPopoverController object.
 */
+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter;

/**
 Method to create UIPopoverController of concrete size. Keep in mind, however, that UIPickerView on iOS 6 and iOS 7 generally has a default size of 320x216 points.
 
 @param presenter DTPickerViewPresenter or DTDatePickerPresenter instance to manage picker.
 
 @param size desired size of UIPopoverController
 
 @result UIPopoverController object.
 */
+ (UIPopoverController *)dt_popoverWithPresenter:(id)presenter ofSize:(CGSize)size;

/**
 Getter for presenter object, previously set on UIPopoverController object.
 
 @return DTPickerViewPresenter or DTDatePickerPresenter object.
 */
- (id)dt_presenter;

@end