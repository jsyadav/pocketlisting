//
//  MShapeStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MShapeStyle.h"
#import "MStyleContext.h"
#import "MShape.h"
#import "MGlobalCoreRects.h"
#import "MCorePreprocessorMacros.h"

@implementation MShapeStyle

@synthesize shape = _shape;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_shape);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MShapeStyle*)styleWithShape:(MShape*)shape next:(MStyle*)next {
    MShapeStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.shape = shape;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    UIEdgeInsets shapeInsets = [_shape insetsForSize:context.frame.size];
    context.contentFrame = MRectInset(context.contentFrame, shapeInsets);
    context.shape = _shape;
    [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
    UIEdgeInsets shapeInsets = [_shape insetsForSize:size];
    insets.top += shapeInsets.top;
    insets.right += shapeInsets.right;
    insets.bottom += shapeInsets.bottom;
    insets.left += shapeInsets.left;
    
    if (self.next) {
        return [self.next addToInsets:insets forSize:size];
        
    } else {
        return insets;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    CGSize innerSize = [self.next addToSize:size context:context];
    UIEdgeInsets shapeInsets = [_shape insetsForSize:innerSize];
    innerSize.width += shapeInsets.left + shapeInsets.right;
    innerSize.height += shapeInsets.top + shapeInsets.bottom;
    
    return innerSize;
}


@end
