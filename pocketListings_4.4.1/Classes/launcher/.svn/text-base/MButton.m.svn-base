//
//  MButton.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MButton.h"
#import "MButtonContent.h"
#import "MTextStyle.h"
#import "MPartStyle.h"
#import "MBoxStyle.h"
#import "MStyleContext.h"
#import "MImageView.h"
#import "MStyleSheet.h"
#import "MImageStyle.h"
#import "UIImageAdditions.h"
#import "MCorePreprocessorMacros.h"

@implementation MButton

@synthesize font        = _font;
@synthesize isVertical  = _isVertical;
@synthesize imageDelegate = _imageDelegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_content);
    TT_RELEASE_SAFELY(_font);
    self.imageDelegate = nil;
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MButton*)buttonWithStyle:(NSString*)selector {
    MButton* button = [[[self alloc] init] autorelease];
    [button setStylesWithSelector:selector];
    return button;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MButton*)buttonWithStyle:(NSString*)selector title:(NSString*)title {
    MButton* button = [[[self alloc] init] autorelease];
    [button setTitle:title forState:UIControlStateNormal];
    [button setStylesWithSelector:selector];
    return button;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)keyForState:(UIControlState)state {
    static NSString* normalKey = @"normal";
    static NSString* highlighted = @"highlighted";
    static NSString* selected = @"selected";
    static NSString* disabled = @"disabled";
    if (state & UIControlStateHighlighted) {
        return highlighted;
        
    } else if (state & UIControlStateSelected) {
        return selected;
        
    } else if (state & UIControlStateDisabled) {
        return disabled;
        
    } else {
        return normalKey;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MButtonContent*)contentForState:(UIControlState)state {
    if (!_content) {
        _content = [[NSMutableDictionary alloc] init];
    }
    
    id key = [self keyForState:state];
    MButtonContent* content = [_content objectForKey:key];
    if (!content) {
        content = [[[MButtonContent alloc] initWithButton:self] autorelease];
        [_content setObject:content forKey:key];
    }
    
    return content;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MButtonContent*)contentForCurrentState {
    MButtonContent* content = nil;
    if (self.selected) {
        content = [self contentForState:UIControlStateSelected];
        
    } else if (self.highlighted) {
        content = [self contentForState:UIControlStateHighlighted];
        
    } else if (!self.enabled) {
        content = [self contentForState:UIControlStateDisabled];
    }
    
    return content ? content : [self contentForState:UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForCurrentState {
    MButtonContent* content = [self contentForCurrentState];
    return content.title ? content.title : [self contentForState:UIControlStateNormal].title;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)imageForCurrentState {
    MButtonContent* content = [self contentForCurrentState];
    return content.image ? content.image : [self contentForState:UIControlStateNormal].image;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)styleForCurrentState {
    MButtonContent* content = [self contentForCurrentState];
    return content.style ? content.style : [self contentForState:UIControlStateNormal].style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)fontForCurrentState {
    if (_font) {
        return _font;
        
    } else {
        MStyle* style = [self styleForCurrentState];
        MTextStyle* textStyle = (MTextStyle*)[style firstStyleOfClass:[MTextStyle class]];
        if (textStyle.font) {
            return textStyle.font;
            
        } else {
            return self.font;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect {
    MStyle* style = [self styleForCurrentState];
    if (style) {
        CGRect textFrame = self.bounds;
        
        MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
        context.delegate = self;
        
        MPartStyle* imageStyle = [style styleForPart:@"image"];
        MBoxStyle* imageBoxStyle = nil;
        CGSize imageSize = CGSizeZero;
        if (imageStyle) {
            imageBoxStyle = [imageStyle.style firstStyleOfClass:[MBoxStyle class]];
            imageSize = [imageStyle.style addToSize:CGSizeZero context:context];
            if (_isVertical) {
                CGFloat height = imageSize.height + imageBoxStyle.margin.top + imageBoxStyle.margin.bottom;
                textFrame.origin.y += height;
                textFrame.size.height -= height;
                
            } else {
                textFrame.origin.x += imageSize.width + imageBoxStyle.margin.right;
                textFrame.size.width -= imageSize.width + imageBoxStyle.margin.right;
            }
        }
        
        context.delegate = self;
        context.frame = self.bounds;
        context.contentFrame = textFrame;
        context.font = [self fontForCurrentState];
        
        [style draw:context];
        
        if (imageStyle) {
            CGRect frame = context.contentFrame;
            if (_isVertical) {
                frame = self.bounds;
                frame.origin.x += imageBoxStyle.margin.left;
                frame.origin.y += imageBoxStyle.margin.top;
                
            } else {
                frame.size = imageSize;
                frame.origin.x += imageBoxStyle.margin.left;
                frame.origin.y += imageBoxStyle.margin.top;
            }
            
            context.frame = frame;
            context.contentFrame = context.frame;
            context.shape = nil;
            
            [imageStyle drawPart:context];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)sizeThatFits:(CGSize)size {
    MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
    context.delegate = self;
    context.font = [self fontForCurrentState];
    
    MStyle* style = [self styleForCurrentState];
    if (style) {
        return [style addToSize:CGSizeZero context:context];
        
    } else {
        return size;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIControl


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIAccessibility


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isAccessibilityElement {
    return YES;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)accessibilityLabel {
    return [self titleForCurrentState];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIAccessibilityTraits)accessibilityTraits {
    return [super accessibilityTraits] | UIAccessibilityTraitButton;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyleDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)textForLayerWithStyle:(MStyle*)style {
    return [self titleForCurrentState];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)imageForLayerWithStyle:(MStyle*)style {
    return [self imageForCurrentState];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTImageViewDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)imageView:(MImageView*)imageView didLoadImage:(UIImage*)image {
    
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIFont*)font {
    if (!_font) {
        _font =[[[MStyleSheet globalStyleSheet] buttonFont] retain];
    }
    return _font;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setFont:(UIFont*)font {
    if (font != _font) {
        [_font release];
        _font = [font retain];
        [self setNeedsDisplay];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForState:(UIControlState)state {
    return [self contentForState:state].title;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTitle:(NSString*)title forState:(UIControlState)state {
    MButtonContent* content = [self contentForState:state];
    content.title = title;
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)imageForState:(UIControlState)state {
    return [self contentForState:state].imageURL;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setImage:(NSString*)imageURL forState:(UIControlState)state {
    MButtonContent* content = [self contentForState:state];
    content.delegate = self.imageDelegate;
    content.imageURL = imageURL;
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)styleForState:(UIControlState)state {
    return [self contentForState:state].style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setStyle:(MStyle*)style forState:(UIControlState)state {
    MButtonContent* content = [self contentForState:state];
    content.style = style;
    [self setNeedsDisplay];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setStylesWithSelector:(NSString*)selector {
    MStyleSheet* ss = [MStyleSheet globalStyleSheet];
    
    MStyle* normalStyle = [ss styleWithSelector:selector forState:UIControlStateNormal];
    [self setStyle:normalStyle forState:UIControlStateNormal];
    
    MStyle* highlightedStyle = [ss styleWithSelector:selector forState:UIControlStateHighlighted];
    [self setStyle:highlightedStyle forState:UIControlStateHighlighted];
    
    MStyle* selectedStyle = [ss styleWithSelector:selector forState:UIControlStateSelected];
    [self setStyle:selectedStyle forState:UIControlStateSelected];
    
    MStyle* disabledStyle = [ss styleWithSelector:selector forState:UIControlStateDisabled];
    [self setStyle:disabledStyle forState:UIControlStateDisabled];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)suspendLoadingImages:(BOOL)suspended {
    MButtonContent* content = [self contentForCurrentState];
    if (suspended) {
        [content stopLoading];
        
    } else if (!content.image) {
        [content reload];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)rectForImage {
    MStyle* style = [self styleForCurrentState];
    if (style) {
        MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
        context.delegate = self;
        
        MPartStyle* imagePartStyle = [style styleForPart:@"image"];
        if (imagePartStyle) {
            MImageStyle* imageStyle = [imagePartStyle.style firstStyleOfClass:[MImageStyle class]];
            MBoxStyle* imageBoxStyle = [imagePartStyle.style firstStyleOfClass:[MBoxStyle class]];
            CGSize imageSize = [imagePartStyle.style addToSize:CGSizeZero context:context];
            
            CGRect frame = context.contentFrame;
            if (_isVertical) {
                frame = self.bounds;
                frame.origin.x += imageBoxStyle.margin.left;
                frame.origin.y += imageBoxStyle.margin.top;
                
            } else {
                frame.size = imageSize;
                frame.origin.x += imageBoxStyle.margin.left;
                frame.origin.y += imageBoxStyle.margin.top;
            }
            
            UIImage* image = [self imageForCurrentState];
            return [image convertRect:frame withContentMode:imageStyle.contentMode];
        }
    }
    
    return CGRectZero;
}


@end
