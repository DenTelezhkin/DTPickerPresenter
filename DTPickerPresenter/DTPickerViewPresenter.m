//
//  DTPickerViewPresenter.m
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerViewPresenter.h"
#import "UIView+LoadFromXib.h"

@implementation DTPickerViewPresenter

+(instancetype)presenterForTextField:(UITextField *)textfield
{
    DTPickerViewPresenter * presenter = [self new];
    
    presenter.textFieldWithPicker = textfield;
    
    DTPickerInputView * inputView = [DTPickerInputView loadFromXib];
    
    inputView.pickerView.delegate = presenter;
    inputView.pickerView.dataSource = presenter;
    inputView.delegate = presenter;
    
    presenter.textFieldWithPicker.inputView = inputView;
    
    return presenter;
}

-(void)setItems:(NSArray *)items
{
    for (NSArray * components in items)
    {
        NSParameterAssert([components isKindOfClass:[NSArray class]]);
    }
    _items = items;
}

-(void)pickerViewDidCancel
{
    [self.textFieldWithPicker resignFirstResponder];
    
    if (self.completionBlock)
    {
        self.completionBlock(nil, nil, YES);
    }
}

-(void)pickerViewDidFinishSelectionWithResult:(NSIndexPath *)selectedIndexPath
{
    [self.textFieldWithPicker resignFirstResponder];
    
    NSMutableArray * resultsArray = [NSMutableArray arrayWithCapacity:[selectedIndexPath length]];
    
    for (int component = 0; component < [selectedIndexPath length] ; component++ )
    {
        NSUInteger selectedValue = [selectedIndexPath indexAtPosition:component];
        [resultsArray addObject:[self.items[component] objectAtIndex:selectedValue]];
    }
    
    self.completionBlock([resultsArray copy],selectedIndexPath,NO);
}

#pragma mark - UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.items[component][row];
}

#pragma mark - UIPickerViewDatasource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.items count];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.items[component] count];
}

@end
