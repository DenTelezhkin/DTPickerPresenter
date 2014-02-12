//
//  DTPickerPresenterSpecs.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTPickerViewPresenter.h"

@interface DTPickerPresenterSpecs : XCTestCase

@end

@implementation DTPickerPresenterSpecs


- (void)testExample
{
    DTPickerViewPresenter * presenter = [DTPickerViewPresenter presenterWithDatasource:nil
                                         changeBlock:^(NSArray *selectedComponents, NSIndexPath *selectedIndexPath, BOOL wasCancelled) {
        
    }];
    
    UITextField * textfield = [UITextField new];
    
    [textfield dt_setPickerPresenter:presenter];
    
    expect([textfield dt_presenter]).to.equal(presenter);
}

-(void)testTextfieldDoesNotAcceptPresenterWithoutBlock
{
    DTPickerViewPresenter * presenter = [DTPickerViewPresenter presenterWithDatasource:nil changeBlock:nil];
    
    UITextField * textfield = [UITextField new];
    
    expect(^{
        [textfield dt_setPickerPresenter:presenter];
    }).to.raiseAny();
}

-(void)testInputView
{
    DTPickerViewPresenter * presenter = [DTPickerViewPresenter presenterWithDatasource:nil changeBlock:^(NSArray *selectedComponents, NSIndexPath *selectedIndexPath, BOOL wasCancelled) {
        
    }];
    
    UITextField * textfield = [UITextField new];
    
    [textfield dt_setPickerPresenter:presenter];
    
    expect(textfield.inputView).to.equal(presenter.pickerView);
}

@end
