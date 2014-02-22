//
//  DTPickerPresenterSpecs.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTPickerViewPresenter.h"
#import "UIPopoverController+DTPickerPresenter.h"
#import "UITextField+DTPickerPresenter.h"

@interface DTPickerPresenterSpecs : XCTestCase
@property (nonatomic, strong) DTPickerViewPresenter * presenter;
@end

@implementation DTPickerPresenterSpecs

- (void)setUp
{
    [super setUp];

    self.presenter = [DTPickerViewPresenter presenterWithDatasource:nil changeBlock:^(NSArray * selectedComponents, NSIndexPath * selectedIndexPath) {

    }];
}

- (void)testPresenterObject
{
    UITextField * textfield = [UITextField new];

    [textfield dt_setPresenter:self.presenter];

    expect([textfield dt_presenter]).to.equal(self.presenter);
}

- (void)testInputView
{
    UITextField * textfield = [UITextField new];

    [textfield dt_setPresenter:self.presenter];

    expect(textfield.inputView).to.equal(self.presenter.pickerView);
}

- (void)testPopoverPresenter
{
    UIPopoverController * controller = [UIPopoverController dt_popoverWithPresenter:self.presenter];
    expect([controller dt_presenter]).to.equal(self.presenter);
}

- (void)testDatePickerAddedAsSubview
{
    UIPopoverController * controller = [UIPopoverController dt_popoverWithPresenter:self.presenter];

    UIViewController * contentController = [controller contentViewController];
    expect(self.presenter.pickerView.superview).to.equal(contentController.view);
}

@end
