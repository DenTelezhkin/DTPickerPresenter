//
//  DTPickerViewPresenter.h
//  LiverpoolOne
//
//  Created by Denys Telezhkin on 30.01.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "UITextField+DTPickerPresenterAdditions.h"
#import "DTPickerViewDatasource.h"

typedef void(^DTPickerChangeBlock)(NSArray * selectedComponents, NSIndexPath * selectedIndexPath, BOOL wasCancelled);

@interface DTPickerViewPresenter : NSObject

@property (nonatomic, strong) UIPickerView * pickerView;

@property (nonatomic, strong) id <DTPickerViewDatasource> dataSource;

@property (nonatomic, copy) DTPickerChangeBlock changeBlock;

+ (instancetype)presenterWithDatasource:(id <DTPickerViewDatasource>)dataSource
                            changeBlock:(DTPickerChangeBlock)changeBlock;

@end
