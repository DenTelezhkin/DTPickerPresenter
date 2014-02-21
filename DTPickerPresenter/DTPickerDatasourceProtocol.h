//
//  DTPickerViewDatasource.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

/**
 `DTPickerDatasourceProtocol` is a protocol for UIPickerView datasource class. Unfortunately, separation between UIPickerViewDelegate and UIPickerViewDatasource is pretty much wrong. Class, implementing this protocol should respond to all datasource methods, even if they are declared in UIPickerViewDelegate. 
 
 One additional request is to trampoline UIPickerViewDelegate didSelectRow: method to delegate of this class, which is supposed to be `true` delegate, responding to events, rather than providing datasource.
 */

@protocol DTPickerDatasourceProtocol <UIPickerViewDelegate, UIPickerViewDataSource>

/**
 UIPickerViewDelegate object.
 */
@property (nonatomic, weak) id <UIPickerViewDelegate> delegate;

/**
 Array of arrays of items, providing data for UIPickerView. 
 */
@property (nonatomic, retain) NSArray * items;

@end
