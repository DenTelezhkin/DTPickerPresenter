//
//  DTPickerDatasource.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerDatasourceProtocol.h"

/**
 `DTPickerDatasource` is datasource class, that provides data for UIPickerView, and trampolines delegate methods to UIPickerViewDelegate. Currently supported NSString and NSAttributedString models. Feel free to subclass this class for additional customization.
 */
@interface DTPickerDataSource : NSObject <DTPickerDatasourceProtocol>

/**
 Shortcut method to create datasource object.
 */
+ (instancetype)datasourceWithItems:(NSArray *)items;

/**
 Data models for UIPickerView. These should be stored as NSArray of NSArrays. They represent components, and rows in components.
 */
@property (nonatomic, retain) NSArray * items;

/**
 `True` UIPickerView delegate. UIPickerViewDelegate didSelectRow:inComponent: method is trampolined to it.
 */
@property (nonatomic, weak) id <UIPickerViewDelegate> delegate;

@end
