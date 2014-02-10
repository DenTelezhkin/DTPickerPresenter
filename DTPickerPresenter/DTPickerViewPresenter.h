//
//  DTPickerViewPresenter.h
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerInputView.h"

typedef void(^DTPickerViewPresenterCompletionBlock)(NSArray * selectedComponents,NSIndexPath * selectedIndexPath, BOOL wasCancelled);

@interface DTPickerViewPresenter : NSObject <DTPickerInputViewSelection,UIPickerViewDataSource,UIPickerViewDelegate>

+(instancetype)presenterForTextField:(UITextField *)textfield;

/**
 This property needs to hold an array of arrays - items for UIPickerView
 */

@property (nonatomic, retain) NSArray * items;

@property (nonatomic, weak) UITextField * textFieldWithPicker;

@property (nonatomic, copy) DTPickerViewPresenterCompletionBlock completionBlock;

@end
