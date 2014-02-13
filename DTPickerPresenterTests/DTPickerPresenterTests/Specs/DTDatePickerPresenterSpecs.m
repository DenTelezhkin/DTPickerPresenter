//
//  DTDatePickerPresenterSpecs.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTDatePickerPresenter.h"
#import "UITextField+DTPickerPresenterAdditions.h"

@interface DTDatePickerPresenterSpecs : XCTestCase

@end

@implementation DTDatePickerPresenterSpecs

- (void)testAssociatedObjects
{
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate *selectedDate) {
    }];
    
    UITextField * textfield = [UITextField new];
    
    [textfield dt_setPresenter:presenter];
    
    expect([textfield dt_presenter]).to.equal(presenter);
}

-(void)testTextfieldDoesNotAcceptPresenterWithoutBlock
{
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:nil];
    
    UITextField * textfield = [UITextField new];
    
    expect(^{
        [textfield dt_setPresenter:presenter];
    }).to.raiseAny();
}

-(void)testInputView
{
    DTDatePickerPresenter * presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate *selectedDate) {
    }];
    
    UITextField * textfield = [UITextField new];
    
    [textfield dt_setPresenter:presenter];
    
    expect(textfield.inputView).to.equal(presenter.datePicker);
}

@end
