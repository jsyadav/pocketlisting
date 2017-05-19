//
//  MInsetStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MInsetStyle.h"
#import "MStyleContext.h"
#import "MCorePreprocessorMacros.h"

@implementation MInsetStyle

@synthesize inset = _inset;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _inset = UIEdgeInsetsZero;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MInsetStyle*)styleWithInset:(UIEdgeInsets)inset next:(MStyle*)next {
    MInsetStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.inset = inset;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    CGRect rect = context.frame;
    context.frame = CGRectMake(rect.origin.x+_inset.left, rect.origin.y+_inset.top,
                               rect.size.width - (_inset.left + _inset.right),
                               rect.size.height - (_inset.top + _inset.bottom));
    [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
    insets.top += _inset.top;
    insets.right += _inset.right;
    insets.bottom += _inset.bottom;
    insets.left += _inset.left;
    if (self.next) {
        return [self.next addToInsets:insets forSize:size];
        
    } else {
        return insets;
    }
}


@end
