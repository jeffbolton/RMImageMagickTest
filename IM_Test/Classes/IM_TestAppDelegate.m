//
//  IM_TestAppDelegate.m
//  IM_Test
//
//  Created by Claudio Marforio on 7/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "IM_TestAppDelegate.h"
#import "IM_TestViewController.h"

@implementation IM_TestAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	window.rootViewController = [IM_TestViewController new];
	[window makeKeyAndVisible];
}

@end
