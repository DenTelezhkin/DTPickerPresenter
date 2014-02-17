//
//  DTPickerDatasource.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerDataSource.h"

@implementation DTPickerDataSource

+ (instancetype)datasourceWithItems:(NSArray *)items
{
    for (NSArray * components in items) {
        NSParameterAssert([components isKindOfClass:[NSArray class]]);
    }

    DTPickerDataSource * datasource = [self new];

    datasource.items = items;

    return datasource;
}

#pragma mark - UIPickerView delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.delegate pickerView:pickerView
                 didSelectRow:row
                  inComponent:component];
}

#pragma mark - UIPickerView datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.items count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSUInteger)component
{
    return [self.items[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSUInteger)row forComponent:(NSUInteger)component
{
    return self.items[component][row];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSUInteger)row forComponent:(NSUInteger)component
{
    if ([self.items[component][row] isKindOfClass:[NSAttributedString class]])
    {
        return self.items[component][row];
    }

    return nil;
}

@end