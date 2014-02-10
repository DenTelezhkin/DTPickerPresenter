//
//  DTPickerInputView.m
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerInputView.h"

@implementation DTPickerInputView

- (IBAction)cancelTapped:(UIBarButtonItem *)sender
{
    [self.delegate pickerViewDidCancel];
}

- (IBAction)doneTapped:(UIBarButtonItem *)sender
{
    NSIndexPath * selectedIndexPath = [[NSIndexPath alloc] init];
    
    for (int component = 0; component<self.pickerView.numberOfComponents; component++)
    {
        selectedIndexPath = [selectedIndexPath indexPathByAddingIndex:[self.pickerView selectedRowInComponent:component]];
    }
    [self.delegate pickerViewDidFinishSelectionWithResult:selectedIndexPath];
}


@end
