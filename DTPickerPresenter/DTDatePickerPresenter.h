//
//  DTDatePickerPresenter.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

typedef void(^DTDatePickerChangeBlock)(NSDate * selectedDate);

/**
 `DTDatePickerPresenter` manages UIDatePicker presentation and reacts to changes in it. This class does not depend on interface paradygm, or a way UIDatePicker is presented. UIDatePicker object is created and observed automatically.
 */
@interface DTDatePickerPresenter : NSObject

/**
 UIDatePicker object to present.
 */

@property (nonatomic, strong) UIDatePicker * datePicker;

/**
 Change block, that will be called automatically, whenever UIDatePicker value changes.
 */
@property (nonatomic, copy) DTDatePickerChangeBlock changeBlock;

/**
 Convenience method to create DTDatePickerPresenter instance.
 
 @param changeBlock block to call, whenever value changes
 
 @result instance of DTDatePickerPresenter object.
 */

+ (instancetype)presenterWithChangeBlock:(DTDatePickerChangeBlock)changeBlock;

@end
