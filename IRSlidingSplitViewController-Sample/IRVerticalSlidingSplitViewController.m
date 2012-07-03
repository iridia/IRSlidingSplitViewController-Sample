//
//  IRVerticalSlidingSplitViewController.m
//  IRSlidingSplitViewController-Sample
//
//  Created by Evadne Wu on 7/3/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRVerticalSlidingSplitViewController.h"

@implementation IRVerticalSlidingSplitViewController

- (CGRect) rectForDetailView {

	if (self.showingMasterViewController)
		return CGRectOffset(self.view.bounds, 0.0f, (CGRectGetHeight(self.view.bounds) - 16.0f));
	
	return self.view.bounds;

}

- (CGPoint) detailViewTranslationForGestureTranslation:(CGPoint)translation {

	return (CGPoint){ 0.0f, translation.y };

}

- (BOOL) shouldShowMasterViewControllerWithGestureTranslation:(CGPoint)translation {

	if (!self.showingMasterViewController && translation.y > 0)
		return YES;
		
	if (self.showingMasterViewController && translation.y < 0)
		return NO;
	
	return self.showingMasterViewController;

}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {

	return YES;

}

@end
