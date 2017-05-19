//
//  MStyleContext.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyleContext.h"
#import "MRectangleShape.h"
#import "MCorePreprocessorMacros.h"

@implementation MStyleContext

@synthesize frame           = _frame;
@synthesize contentFrame    = _contentFrame;
@synthesize shape           = _shape;
@synthesize font            = _font;
@synthesize didDrawContent  = _didDrawContent;
@synthesize delegate        = _delegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [super init];
    if (self) {
        _frame = CGRectZero;
        _contentFrame = CGRectZero;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_shape);
    TT_RELEASE_SAFELY(_font);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MShape*)shape {
    if (!_shape) {
        _shape = [[MRectangleShape shape] retain];
    }
    
    return _shape;
}


@end
