//
//  IREasingView.m
//  IRSlidingSplitViewController-Sample
//
//  Created by Evadne Wu on 7/4/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import "IREasingView.h"
#import "CAKeyframeAnimation+AHEasing.h"

@interface IREasingLayer : CALayer

@end


@implementation IREasingView

+ (Class) layerClass {

	return [IREasingLayer class];

}

@end

@implementation IREasingLayer

- (void) addAnimation:(CAAnimation *)anim forKey:(NSString *)key {

	if ([anim isKindOfClass:[CABasicAnimation class]]) {
	
		CABasicAnimation *basicAnimation = (CABasicAnimation *)anim;
		NSValue *fromValue = basicAnimation.fromValue;
		NSValue *toValue = basicAnimation.toValue;
		NSValue *currentValue = [self valueForKeyPath:key];
		
		NSValue *actualFromValue = fromValue ? fromValue : currentValue;
		NSValue *actualToValue = toValue ? toValue : currentValue;
		
		CAKeyframeAnimation *override = nil;
		
		if ([key isEqualToString:@"position"]) {
		
			CGPoint fromPoint = [actualFromValue CGPointValue];
			CGPoint toPoint = [actualToValue CGPointValue];
		
			override = [CAKeyframeAnimation animationWithKeyPath:key function:&CubicEaseIn fromPoint:fromPoint toPoint:toPoint];
		
		} //	TBD: other properties?
		
		if (override) {
		
			override.duration = anim.duration;
		
			override.beginTime = anim.beginTime;
			override.speed = anim.speed;
			override.timeOffset = anim.timeOffset;
			override.repeatCount = anim.repeatCount;
			override.repeatDuration = anim.repeatDuration;
			override.autoreverses = anim.autoreverses;
			override.fillMode = anim.fillMode;
			
			//	?
			//	override.timingFunction = anim.timingFunction;
			override.delegate = anim.delegate;
			override.removedOnCompletion = anim.removedOnCompletion;
		
			[super addAnimation:override forKey:key];
		
		} else {
		
			[super addAnimation:anim forKey:key];
		
		}
	
	} else {

		[super addAnimation:anim forKey:key];
	
	}

}

@end