//
//  DTDatePickerPresenterSpecs.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTDatePickerPresenter.h"
#import "UITextField+DTPickerPresenter.h"
#import "UIPopoverController+DTPickerPresenter.h"

@interface DTDatePickerPresenterSpecs : XCTestCase
@property (nonatomic, strong) DTDatePickerPresenter * presenter;
@end

@implementation DTDatePickerPresenterSpecs

-(void)setUp
{
    [super setUp];

    self.presenter = [DTDatePickerPresenter presenterWithChangeBlock:^(NSDate * selectedDate) {
    }];
}

- (void)tearDown
{
    [super tearDown];
    self.presenter = nil;
}

- (void)testAssociatedObjects
{
    UITextField * textfield = [UITextField new];

    [textfield dt_setPresenter:self.presenter];

    expect([textfield dt_presenter]).to.equal(self.presenter);
}

- (void)testInputView
{
    UITextField * textfield = [UITextField new];

    [textfield dt_setPresenter:self.presenter];

    expect(textfield.inputView).to.equal(self.presenter.datePicker);
}

-(void)testPopoverPresenter
{
    UIPopoverController * controller = [UIPopoverController dt_popoverWithPresenter:self.presenter];
    expect([controller dt_presenter]).to.equal(self.presenter);
}

-(void)testDatePickerAddedAsSubview
{
    UIPopoverController * controller = [UIPopoverController dt_popoverWithPresenter:self.presenter];

    UIViewController * contentController = [controller contentViewController];
    expect(self.presenter.datePicker.superview).to.equal(contentController.view);
}
@end
