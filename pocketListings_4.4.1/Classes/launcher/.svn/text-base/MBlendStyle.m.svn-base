//
//  MBlendStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MBlendStyle.h"
#import "MStyleContext.h"
#import "MCorePreprocessorMacros.h"

@implementation MBlendStyle

@synthesize blendMode = _blendMode;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _blendMode = kCGBlendModeNormal;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBlendStyle*)styleWithBlend:(CGBlendMode)blendMode next:(MStyle*)next {
    MBlendStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.blendMode = blendMode;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    if (_blendMode) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        CGContextSetBlendMode(ctx, _blendMode);
        
        [self.next draw:context];
        CGContextRestoreGState(ctx);
        
    } else {
        return [self.next draw:context];
    }
}


@end
