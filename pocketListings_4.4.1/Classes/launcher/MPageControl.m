//
//  MPageControl.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MPageControl.h"
#import "MStyleContext.h"
#import "MBoxStyle.h"
#import "MStyleSheet.h"
#import "UIViewAdditions.h"
#import "MCorePreprocessorMacros.h"

@implementation MPageControl

@synthesize numberOfPages       = _numberOfPages;
@synthesize currentPage         = _currentPage;
@synthesize dotStyle            = _dotStyle;
@synthesize hidesForSinglePage  = _hidesForSinglePage;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.dotStyle = @"pageDot:";
        self.hidesForSinglePage = NO;
        self.contentMode = UIViewContentModeRedraw;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_dotStyle);
    TT_RELEASE_SAFELY(_normalDotStyle);
    TT_RELEASE_SAFELY(_currentDotStyle);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Properties


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)normalDotStyle {
    if (!_normalDotStyle) {
        _normalDotStyle = [[[MStyleSheet globalStyleSheet] styleWithSelector:_dotStyle
                                                                     forState:UIControlStateNormal] retain];
    }
    return _normalDotStyle;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)currentDotStyle {
    if (!_currentDotStyle) {
        _currentDotStyle = [[[MStyleSheet globalStyleSheet] styleWithSelector:_dotStyle
                                                                      forState:UIControlStateSelected] retain];
    }
    return _currentDotStyle;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect {
    if (_numberOfPages <= 1 && _hidesForSinglePage) {
        return;
    }
    
    MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
    MBoxStyle* boxStyle = [self.normalDotStyle firstStyleOfClass:[MBoxStyle class]];
    
    CGSize dotSize = [self.normalDotStyle addToSize:CGSizeZero context:context];
    
    CGFloat dotWidth = dotSize.width + boxStyle.margin.left + boxStyle.margin.right;
    CGFloat totalWidth = (dotWidth * _numberOfPages) - (boxStyle.margin.left + boxStyle.margin.right);
    CGRect contentRect = CGRectMake(round(self.width/2 - totalWidth/2),
                                    round(self.height/2 - dotSize.height/2),
                                    dotSize.width, dotSize.height);
    
    for (NSInteger i = 0; i < _numberOfPages; ++i) {
        contentRect.origin.x += boxStyle.margin.left;
        
        context.frame = contentRect;
        context.contentFrame = contentRect;
        
        if (i == _currentPage) {
            [self.currentDotStyle draw:context];
            
        } else {
            [self.normalDotStyle draw:context];
        }
        contentRect.origin.x += dotSize.width + boxStyle.margin.right;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)sizeThatFits:(CGSize)size {
    MStyleContext* context = [[[MStyleContext alloc] init] autorelease];
    CGSize dotSize = [self.normalDotStyle addToSize:CGSizeZero context:context];
    
    CGFloat margin = 0;
    MBoxStyle* boxStyle = [self.normalDotStyle firstStyleOfClass:[MBoxStyle class]];
    if (boxStyle) {
        margin = boxStyle.margin.right + boxStyle.margin.left;
    }
    
    return CGSizeMake((dotSize.width * _numberOfPages) + (margin * (_numberOfPages-1)),
                      dotSize.height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIControl


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    if (self.touchInside) {
        CGPoint point = [touch locationInView:self];
        
        if (point.x < self.width / 2) {
            self.currentPage = self.currentPage - 1;
            
        } else {
            self.currentPage = self.currentPage + 1;
        }
        
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setNumberOfPages:(NSInteger)numberOfPages {
    if (numberOfPages != _numberOfPages) {
        
        _numberOfPages = MAX(0, numberOfPages);
        [self setNeedsDisplay];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCurrentPage:(NSInteger)currentPage {
    if (currentPage != _currentPage) {
        _currentPage = MAX(0, MIN(_numberOfPages - 1,currentPage));
        [self setNeedsDisplay];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDotStyle:(NSString*)dotStyle {
    if (![dotStyle isEqualToString:_dotStyle]) {
        [_dotStyle release];
        _dotStyle = [dotStyle copy];
        TT_RELEASE_SAFELY(_normalDotStyle);
        TT_RELEASE_SAFELY(_currentDotStyle);
    }
}


@end
