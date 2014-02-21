//
//  DTPickerViewDatasource.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

@protocol DTPickerDatasourceProtocol <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <UIPickerViewDelegate> delegate;
@property (nonatomic, retain) NSArray * items;

@end
