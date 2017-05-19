//
//  MTextStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MTextStyle.h"
#import "MStyle.h"
#import "MStyleContext.h"
#import "UIFontAdditions.h"
#import "MCorePreprocessorMacros.h"

@implementation MTextStyle 
@synthesize font              = _font;
@synthesize color             = _color;
@synthesize shadowColor       = _shadowColor;
@synthesize shadowOffset      = _shadowOffset;
@synthesize minimumFontSize   = _minimumFontSize;
@synthesize numberOfLines     = _numberOfLines;
@synthesize textAlignment     = _textAlignment;
@synthesize verticalAlignment = _verticalAlignment;
@synthesize lineBreakMode     = _lineBreakMode;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _shadowOffset = CGSizeZero;
        _numberOfLines = 1;
        _textAlignment = UITextAlignmentCenter;
        _verticalAlignment = UIControlContentVerticalAlignmentCenter;
        _lineBreakMode = UILineBreakModeTailTruncation;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_font);
    TT_RELEASE_SAFELY(_color);
    TT_RELEASE_SAFELY(_shadowColor);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithColor:(UIColor*)color next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.color = color;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    style.color = color;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
textAlignment:(UITextAlignment)textAlignment next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    style.color = color;
    style.textAlignment = textAlignment;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    style.color = color;
    style.shadowColor = shadowColor;
    style.shadowOffset = shadowOffset;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
minimumFontSize:(CGFloat)minimumFontSize
shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    style.color = color;
    style.minimumFontSize = minimumFontSize;
    style.shadowColor = shadowColor;
    style.shadowOffset = shadowOffset;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
minimumFontSize:(CGFloat)minimumFontSize
shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
textAlignment:(UITextAlignment)textAlignment
verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
lineBreakMode:(UILineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines
next:(MStyle*)next {
    MTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.font = font;
    style.color = color;
    style.minimumFontSize = minimumFontSize;
    style.shadowColor = shadowColor;
    style.shadowOffset = shadowOffset;
    style.textAlignment = textAlignment;
    style.verticalAlignment = verticalAlignment;
    style.lineBreakMode = lineBreakMode;
    style.numberOfLines = numberOfLines;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private

- (CGFloat)ttLineHeight:(UIFont*)font {
    return (font.ascender - font.descender) + 1;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)sizeOfText:(NSString*)text withFont:(UIFont*)font size:(CGSize)size {
    if (_numberOfLines == 1) {
        return [text sizeWithFont:font];
        
    } else {
        CGSize maxSize = CGSizeMake(size.width, CGFLOAT_MAX);
        CGSize textSize = [text sizeWithFont:font constrainedToSize:maxSize
                               lineBreakMode:_lineBreakMode];
        if (_numberOfLines) {
            CGFloat maxHeight = [self ttLineHeight:font] * _numberOfLines;
            if (textSize.height > maxHeight) {
                textSize.height = maxHeight;
            }
        }
        return textSize;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)rectForText:(NSString*)text forSize:(CGSize)size withFont:(UIFont*)font {
    CGRect rect = CGRectZero;
    if (_textAlignment == UITextAlignmentLeft
        && _verticalAlignment == UIControlContentVerticalAlignmentTop) {
        rect.size = size;
        
    } else {
        CGSize textSize = [self sizeOfText:text withFont:font size:size];
        
        if (size.width < textSize.width) {
            size.width = textSize.width;
        }
        
        rect.size = textSize;
        
        if (_textAlignment == UITextAlignmentCenter) {
            rect.origin.x = round(size.width/2 - textSize.width/2);
            
        } else if (_textAlignment == UITextAlignmentRight) {
            rect.origin.x = size.width - textSize.width;
        }
        
        if (_verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            rect.origin.y = round(size.height/2 - textSize.height/2);
            
        } else if (_verticalAlignment == UIControlContentVerticalAlignmentBottom) {
            rect.origin.y = size.height - textSize.height;
        }
    }
    return rect;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawText:(NSString*)text context:(MStyleContext*)context {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    UIFont* font = _font ? _font : context.font;
    
    if (nil == font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    
    if (_shadowColor) {
        CGSize offset = CGSizeMake(_shadowOffset.width, -_shadowOffset.height);
        CGContextSetShadowWithColor(ctx, offset, 0, _shadowColor.CGColor);
    }
    
    if (_color) {
        [_color setFill];
    }
    
    CGRect rect = context.contentFrame;
    
    if (_numberOfLines == 1) {
        CGRect titleRect = [self rectForText:text forSize:rect.size withFont:font];
        titleRect.size = [text drawAtPoint:
                          CGPointMake(titleRect.origin.x+rect.origin.x,
                                      titleRect.origin.y+rect.origin.y)
                                  forWidth:rect.size.width withFont:font
                               minFontSize:_minimumFontSize ? _minimumFontSize : font.pointSize
                            actualFontSize:nil lineBreakMode:_lineBreakMode
                        baselineAdjustment:UIBaselineAdjustmentAlignCenters];
        context.contentFrame = titleRect;
        
    } else {
        CGRect titleRect = [self rectForText:text forSize:rect.size withFont:font];
        titleRect = CGRectOffset(titleRect, rect.origin.x, rect.origin.y);
        rect.size = [text drawInRect:titleRect withFont:font lineBreakMode:_lineBreakMode
                           alignment:_textAlignment];
        context.contentFrame = rect;
    }
    
    CGContextRestoreGState(ctx);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    if ([context.delegate respondsToSelector:@selector(textForLayerWithStyle:)]) {
        NSString* text = [context.delegate textForLayerWithStyle:self];
        if (text) {
            context.didDrawContent = YES;
            [self drawText:text context:context];
        }
    }
    
    if (!context.didDrawContent
        && [context.delegate respondsToSelector:@selector(drawLayer:withStyle:)]) {
        [context.delegate drawLayer:context withStyle:self];
        context.didDrawContent = YES;
    }
    
    [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    if ([context.delegate respondsToSelector:@selector(textForLayerWithStyle:)]) {
        NSString* text = [context.delegate textForLayerWithStyle:self];
        UIFont* font = _font ? _font : context.font;
        
        CGFloat maxWidth = context.contentFrame.size.width;
        if (!maxWidth) {
            maxWidth = CGFLOAT_MAX;
        }
        CGFloat maxHeight = _numberOfLines ? _numberOfLines * font.ttLineHeight : CGFLOAT_MAX;
        CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
        CGSize textSize = [self sizeOfText:text withFont:font size:maxSize];
        
        size.width += textSize.width;
        size.height += textSize.height;
    }
    
    if (_next) {
        return [self.next addToSize:size context:context];
        
    } else {
        return size;
    }
}


@end
