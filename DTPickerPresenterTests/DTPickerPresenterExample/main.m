//
//  main.m
//  DTPickerPresenterTests
//
//  Created by Denys Telezhkin on 10.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

static bool isRunningTests()
{
    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
    NSString* injectBundle = environment[@"XCInjectBundle"];
    return [[injectBundle pathExtension] isEqualToString:@"xctest"];
}

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        if (isRunningTests())
        {
            return UIApplicationMain(argc, argv, nil, nil);
        }
        else {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }
}
