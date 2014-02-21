//
//  DTPickerViewPresenter.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerViewPresenter.h"

@interface DTPickerViewPresenter () <UIPickerViewDelegate>
@end

@implementation DTPickerViewPresenter

@synthesize pickerView=_pickerView;

+ (instancetype)presenterWithDatasource:(id <DTPickerDatasourceProtocol>)dataSource
                            changeBlock:(DTPickerChangeBlock)changeBlock
{
    DTPickerViewPresenter * presenter = [self new];

    presenter.dataSource = dataSource;
    [dataSource setDelegate:presenter];
    presenter.changeBlock = changeBlock;

    return presenter;
}

- (void)setPickerView:(UIPickerView *)pickerView
{
    NSParameterAssert([pickerView isKindOfClass:[UIPickerView class]]);

    _pickerView = pickerView;
}

- (UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [UIPickerView new];
        _pickerView.dataSource = self.dataSource;
        _pickerView.delegate = self.dataSource;
        _pickerView.showsSelectionIndicator = YES;
    }
    return _pickerView;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSIndexPath * selectedIndexPath = [NSIndexPath new];

    for (NSInteger i = 0; i < self.pickerView.numberOfComponents; i++) {
        selectedIndexPath = [selectedIndexPath indexPathByAddingIndex:(NSUInteger)[self.pickerView selectedRowInComponent:i]];
    }

    NSMutableArray * resultsArray = [NSMutableArray arrayWithCapacity:[selectedIndexPath length]];

    for (NSUInteger position = 0; position < [selectedIndexPath length]; position++) {
        NSUInteger selectedValue = [selectedIndexPath indexAtPosition:position];
        [resultsArray addObject:[self.dataSource.items[position] objectAtIndex:selectedValue]];
    }

    self.changeBlock([resultsArray copy], selectedIndexPath, NO);
}

@end
