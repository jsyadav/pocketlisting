//
//  MFourBorderStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MFourBorderStyle.h"
#import "MStyleContext.h"
#import "MGlobalCoreRects.h"
#import "MCorePreprocessorMacros.h"

const NSInteger kDefaultLightSource = 125;

@implementation MFourBorderStyle

@synthesize top     = _top;
@synthesize right   = _right;
@synthesize bottom  = _bottom;
@synthesize left    = _left;
@synthesize width   = _width;


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
    TT_RELEASE_SAFELY(_top);
    TT_RELEASE_SAFELY(_right);
    TT_RELEASE_SAFELY(_bottom);
    TT_RELEASE_SAFELY(_left);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MFourBorderStyle*)styleWithTop:(UIColor*)top right:(UIColor*)right bottom:(UIColor*)bottom
                              left:(UIColor*)left width:(CGFloat)width next:(MStyle*)next {
    MFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.top = top;
    style.right = right;
    style.bottom = bottom;
    style.left = left;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MFourBorderStyle*)styleWithTop:(UIColor*)top width:(CGFloat)width next:(MStyle*)next {
    MFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.top = top;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MFourBorderStyle*)styleWithRight:(UIColor*)right width:(CGFloat)width next:(MStyle*)next {
    MFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.right = right;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MFourBorderStyle*)styleWithBottom:(UIColor*)bottom width:(CGFloat)width next:(MStyle*)next {
    MFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.bottom = bottom;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MFourBorderStyle*)styleWithLeft:(UIColor*)left width:(CGFloat)width next:(MStyle*)next {
    MFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.left = left;
    style.width = width;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    CGRect rect = context.frame;
    UIEdgeInsets insets = UIEdgeInsetsMake(_top ? _width/2. : 0,
                                           _left ? _width/2 : 0,
                                           _bottom ? _width/2 : 0,
                                           _right ? _width/2 : 0);
    CGRect strokeRect = MRectInset(rect, insets);
    [context.shape openPath:strokeRect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, _width);
    
    [context.shape addTopEdgeToPath:strokeRect lightSource:kDefaultLightSource];
    if (_top) {
        [_top setStroke];
        
    } else {
        [[UIColor clearColor] setStroke];
    }
    CGContextStrokePath(ctx);
    
    [context.shape addRightEdgeToPath:strokeRect lightSource:kDefaultLightSource];
    if (_right) {
        [_right setStroke];
        
    } else {
        [[UIColor clearColor] setStroke];
    }
    CGContextStrokePath(ctx);
    
    [context.shape addBottomEdgeToPath:strokeRect lightSource:kDefaultLightSource];
    if (_bottom) {
        [_bottom setStroke];
        
    } else {
        [[UIColor clearColor] setStroke];
    }
    CGContextStrokePath(ctx);
    
    [context.shape addLeftEdgeToPath:strokeRect lightSource:kDefaultLightSource];
    if (_left) {
        [_left setStroke];
        
    } else {
        [[UIColor clearColor] setStroke];
    }
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    context.frame = CGRectMake(rect.origin.x + (_left ? _width : 0),
                               rect.origin.y + (_top ? _width : 0),
                               rect.size.width - ((_left ? _width : 0) + (_right ? _width : 0)),
                               rect.size.height - ((_top ? _width : 0) + (_bottom ? _width : 0)));
    return [self.next draw:context];
}


@end
