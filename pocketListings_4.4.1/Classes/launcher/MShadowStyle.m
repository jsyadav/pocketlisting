//
//  MShadowStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MShadowStyle.h"
#import "MStyleContext.h"
#import "MGlobalCoreRects.h"
#import "MCorePreprocessorMacros.h"

@implementation MShadowStyle

@synthesize color   = _color;
@synthesize blur    = _blur;
@synthesize offset  = _offset;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _offset = CGSizeZero;
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
+ (MShadowStyle*)styleWithColor:(UIColor*)color blur:(CGFloat)blur offset:(CGSize)offset
                            next:(MStyle*)next {
    MShadowStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.color = color;
    style.blur = blur;
    style.offset = offset;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    CGFloat blurSize = round(_blur / 2);
    UIEdgeInsets inset = UIEdgeInsetsMake(blurSize, blurSize, blurSize, blurSize);
    if (_offset.width < 0) {
        inset.left += fabs(_offset.width) + blurSize*2;
        inset.right -= blurSize;
        
    } else if (_offset.width > 0) {
        inset.right += fabs(_offset.width) + blurSize*2;
        inset.left -= blurSize;
    }
    if (_offset.height < 0) {
        inset.top += fabs(_offset.height) + blurSize*2;
        inset.bottom -= blurSize;
        
    } else if (_offset.height > 0) {
        inset.bottom += fabs(_offset.height) + blurSize*2;
        inset.top -= blurSize;
    }
    
    context.frame = MRectInset(context.frame, inset);
    context.contentFrame = MRectInset(context.contentFrame, inset);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    // Due to a bug in OS versions 3.2 and 4.0, the shadow appears upside-down. It pains me to
    // write this, but a lot of research has failed to turn up a way to detect the flipped shadow
    // programmatically
    float shadowYOffset = -_offset.height;
    NSString *osVersion = [UIDevice currentDevice].systemVersion;
    if ([osVersion versionStringCompare:@"3.2"] != NSOrderedAscending) {
        shadowYOffset = _offset.height;
    }
    
    [context.shape addToPath:context.frame];
    CGContextSetShadowWithColor(ctx, CGSizeMake(_offset.width, shadowYOffset), _blur,
                                _color.CGColor);
    CGContextBeginTransparencyLayer(ctx, nil);
    [self.next draw:context];
    CGContextEndTransparencyLayer(ctx);
    
    CGContextRestoreGState(ctx);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    CGFloat blurSize = round(_blur / 2);
    size.width += _offset.width + (_offset.width ? blurSize : 0) + blurSize*2;
    size.height += _offset.height + (_offset.height ? blurSize : 0) + blurSize*2;
    
    if (_next) {
        return [self.next addToSize:size context:context];
        
    } else {
        return size;
    }
}


@end
