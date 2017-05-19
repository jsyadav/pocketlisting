//
//  MSolidBorderStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MSolidBorderStyle.h"

#import "MStyleContext.h"
#import "MCorePreprocessorMacros.h"

@implementation MSolidBorderStyle
@synthesize color = _color;
@synthesize width = _width;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _width = 1;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_color);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MSolidBorderStyle*)styleWithColor:(UIColor*)color width:(CGFloat)width next:(MStyle*)next {
    MSolidBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.color = color;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect strokeRect = CGRectInset(context.frame, _width/2, _width/2);
    [context.shape addToPath:strokeRect];
    
    [_color setStroke];
    CGContextSetLineWidth(ctx, _width);
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    context.frame = CGRectInset(context.frame, _width, _width);
    return [self.next draw:context];
}

@end
