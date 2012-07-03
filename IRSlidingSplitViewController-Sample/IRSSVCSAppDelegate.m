//
//  IRSSVCSAppDelegate.m
//  IRSlidingSplitViewController-Sample
//
//  Created by Evadne Wu on 7/3/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IRSSVCSAppDelegate.h"
#import "IRSlidingSplitViewController.h"

@implementation IRSSVCSAppDelegate
@synthesize window = _window;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window = [application.windows lastObject];

	IRSlidingSplitViewController *ssVC = (IRSlidingSplitViewController *)self.window.rootViewController;
	NSCParameterAssert([ssVC isKindOfClass:[IRSlidingSplitViewController class]]);
	
	UIViewController *masterVC = ssVC.masterViewController;
	UIViewController *detailVC = ssVC.detailViewController;
	
	UIView *masterView = masterVC.view;
	UIView *detailView = detailVC.view;
	
	masterView.layer.borderColor = [UIColor redColor].CGColor;
	masterView.layer.borderWidth = 1.0f;
	
	detailView.layer.borderColor = [UIColor blueColor].CGColor;
	detailView.layer.borderWidth = 1.0f;
	
	return YES;
		
}

@end
