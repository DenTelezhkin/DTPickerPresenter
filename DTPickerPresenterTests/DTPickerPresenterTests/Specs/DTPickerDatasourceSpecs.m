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

@end
