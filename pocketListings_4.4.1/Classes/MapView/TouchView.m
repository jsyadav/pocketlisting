//
//  TouchView.m
//  
//
//  Created by Kaustubh
//

#import "TouchView.h"

@interface TouchView ()
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
@end

@implementation TouchView
@synthesize delegate, callAtHitTest;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	
	UIView* returnMe =  [super hitTest:point withEvent:event];
	if (![returnMe isKindOfClass:[UIButton class]]) {
		[delegate performSelector:callAtHitTest];
	}

    return returnMe;
}




@end
