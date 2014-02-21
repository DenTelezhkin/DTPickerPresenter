//
//  DTPickerViewPresenter.h
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerDatasourceProtocol.h"

typedef void(^DTPickerChangeBlock)(NSArray * selectedComponents, NSIndexPath * selectedIndexPath, BOOL wasCancelled);

/**
 `DTPickerViewPresenter` manages UIPickerView presentation and wraps UIPickerViewDelegate callbacks into nice, modern block API. While datasource is a separate class, presenter needs to be notified when UIPickerView values change. Which is datasource needs to call presenter when that happens. If you use default datasource class provided - `DTPickerDatasource`, this happens automatically.
 */

@interface DTPickerViewPresenter : NSObject

/**
 UIPickerView object, that is managed by DTPickerViewPresenter.
 */
@property (nonatomic, strong) UIPickerView * pickerView;

/**
 Datasource object, providing UIPickerView with data to display.
 */
@property (nonatomic, strong) id <DTPickerDatasourceProtocol> dataSource;

/**
 Change block, that will be called automatically, whenever UIPickerView value changes.
 */
@property (nonatomic, copy) DTPickerChangeBlock changeBlock;

/**
 Convenience method to create DTPickerViewPresenter.
 
 @param dataSource datasource object, that needs to provide UIPickerView with data to display.
 
 @param changeBlock block, that will be called for each UIPickerView change
 
 @result instance of DTPickerViewPresenter object.
 */

+ (instancetype)presenterWithDatasource:(id <DTPickerDatasourceProtocol>)dataSource
                            changeBlock:(DTPickerChangeBlock)changeBlock;

@end
