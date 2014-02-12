//
//  DTPickerViewPresenter.m
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerViewPresenter.h"

@interface DTPickerViewPresenter() <UIPickerViewDelegate>
@end

@implementation DTPickerViewPresenter

+(instancetype)presenterWithDatasource:(id<DTPickerViewDatasource>)dataSource
                           changeBlock:(DTPickerChangeBlock)changeBlock
{
    DTPickerViewPresenter * presenter = [self new];
    
    presenter.dataSource = dataSource;
    [dataSource setDelegate:presenter];
    presenter.changeBlock = changeBlock;
    
    return presenter;
}

-(UIPickerView *)pickerView
{
    if (!_pickerView)
    {
        _pickerView = [UIPickerView new];
        _pickerView.dataSource = self.dataSource;
        _pickerView.delegate = self.dataSource;
    }
    return _pickerView;
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSIndexPath * selectedIndexPath = [NSIndexPath new];

    for (int component = 0; component<self.pickerView.numberOfComponents; component++)
    {
        selectedIndexPath = [selectedIndexPath indexPathByAddingIndex:[self.pickerView selectedRowInComponent:component]];
    }

    NSMutableArray * resultsArray = [NSMutableArray arrayWithCapacity:[selectedIndexPath length]];
    
    for (int component = 0; component < [selectedIndexPath length] ; component++ )
    {
        NSUInteger selectedValue = [selectedIndexPath indexAtPosition:component];
        [resultsArray addObject:[self.dataSource.items[component] objectAtIndex:selectedValue]];
    }
    
    self.changeBlock([resultsArray copy],selectedIndexPath,NO);
}

@end
