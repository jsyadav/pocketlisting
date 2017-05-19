//
//  MView.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MView.h"
#import "MStyleSheet.h"
#import "MStyle.h"
#import "MStyleContext.h"
#import "MCorePreprocessorMacros.h"
#import "MLayout.h"


@implementation MView

@synthesize style   = _style;
@synthesize layout  = _layout;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeRedraw;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_style);
    TT_RELEASE_SAFELY(_layout);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect {
    MStyle* style = self.style;
    if (nil != style) {
        MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
        context.delegate = self;
        context.frame = self.bounds;
        context.contentFrame = context.frame;
        
        [style draw:context];
        if (!context.didDrawContent) {
            [self drawContent:self.bounds];
        }
        
    } else {
        [self drawContent:self.bounds];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    MLayout* layout = self.layout;
    if (nil != layout) {
        [layout layoutSubviews:self.subviews forView:self];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)sizeThatFits:(CGSize)size {
    MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
    context.delegate = self;
    context.font = nil;
    return [_style addToSize:CGSizeZero context:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setStyle:(MStyle*)style {
    if (style != _style) {
        [_style release];
        _style = [style retain];
        
        [self setNeedsDisplay];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawContent:(CGRect)rect {
}


@end
