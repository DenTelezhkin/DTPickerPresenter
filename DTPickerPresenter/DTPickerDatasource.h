//
//  DTPickerDatasource.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTPickerViewDatasource.h"

@interface DTPickerDataSource : NSObject <DTPickerViewDatasource>

+ (instancetype)datasourceWithItems:(NSArray *)items;

@property (nonatomic, retain) NSArray * items;

@property (nonatomic, weak) id <UIPickerViewDelegate> delegate;

@end
