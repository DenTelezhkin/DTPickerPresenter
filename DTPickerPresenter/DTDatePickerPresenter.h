//
//  DTDatePickerPresenter.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "UITextField+DTPickerPresenterAdditions.h"

typedef void(^DTDatePickerChangeBlock) (NSDate * selectedDate);

@interface DTDatePickerPresenter : NSObject

@property (nonatomic, retain) UIDatePicker * datePicker;

@property (nonatomic, copy) DTDatePickerChangeBlock selectBlock;

+(instancetype)presenterWithChangeBlock:(DTDatePickerChangeBlock)resultBlock;

@end
