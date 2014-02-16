//
//  AppDelegate.m
//  DTPickerPresenterTests
//
//  Created by Denys Telezhkin on 10.02.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "AppDelegate.h"
#import "iPhonePickerController.h"
#import "iPadPickerController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    UIViewController * controller;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        controller = [iPadPickerController new];
    }
    else {
        controller = [iPhonePickerController new];
    }
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
