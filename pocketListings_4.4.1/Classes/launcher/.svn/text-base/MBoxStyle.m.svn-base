//
//  MBoxStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MBoxStyle.h"
#import "MStyleContext.h"
#import "MGlobalCoreRects.h"
#import "MCorePreprocessorMacros.h"

@implementation MBoxStyle

@synthesize margin    = _margin;
@synthesize padding   = _padding;
@synthesize minSize   = _minSize;
@synthesize position  = _position;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _margin = UIEdgeInsetsZero;
        _padding = UIEdgeInsetsZero;
        _minSize = CGSizeZero;
        _position = MPositionStatic;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(MStyle*)next {
    MBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.margin = margin;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(MStyle*)next {
    MBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.padding = padding;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBoxStyle*)styleWithFloats:(MPosition)position next:(MStyle*)next {
    MBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.position = position;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                          next:(MStyle*)next {
    MBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.margin = margin;
    style.padding = padding;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                       minSize:(CGSize)minSize position:(MPosition)position next:(MStyle*)next {
    MBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.margin = margin;
    style.padding = padding;
    style.minSize = minSize;
    style.position = position;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    context.contentFrame = MRectInset(context.contentFrame, _padding);
    [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    size.width += _padding.left + _padding.right;
    size.height += _padding.top + _padding.bottom;
    
    if (_next) {
        return [self.next addToSize:size context:context];
        
    } else {
        return size;
    }
}


@end
