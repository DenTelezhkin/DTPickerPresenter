//
//  DTPickerDatasourceSpecs.m
//  DTPickerPresenter
//
//  Created by Denys Telezhkin on 12.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "DTPickerDataSource.h"

@interface DTPickerDatasourceSpecs : XCTestCase

@end

@implementation DTPickerDatasourceSpecs

-(void)testNonArrayItemsRaise
{
    expect(^{
        [DTPickerDataSource datasourceWithItems:@[@"foo"]];
    }).to.raiseAny();
}

-(void)testAttributedStrings
{
    NSAttributedString * string1 = [[NSAttributedString alloc] initWithString:@"foo"];
    NSString * string2 = @"bar";
    DTPickerDataSource * dataSource = [DTPickerDataSource datasourceWithItems:@[@[string1,string2]]];

    expect([dataSource pickerView:nil attributedTitleForRow:0 forComponent:0]).to.equal(string1);
    expect([dataSource pickerView:nil attributedTitleForRow:1 forComponent:0]).to.equal(nil);
}

-(void)testNSStings
{
    NSAttributedString * string1 = [[NSAttributedString alloc] initWithString:@"foo"];
    NSString * string2 = @"bar";
    DTPickerDataSource * dataSource = [DTPickerDataSource datasourceWithItems:@[@[string1,string2]]];

    expect([dataSource pickerView:nil titleForRow:1 forComponent:0]).to.equal(string2);
}

@end
