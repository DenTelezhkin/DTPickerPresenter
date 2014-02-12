//
//  UITextField+DTPickerPresenterAdditions.h
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTDatePickerPresenter.h"

@interface UITextField (DTPickerPresenterAdditions)

-(void)dt_setPickerPresenter:(id)dt_presenter;
-(id)dt_presenter;

@end
