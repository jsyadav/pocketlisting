//
//  MStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"
#import "MCorePreprocessorMacros.h"
#import "MPartStyle.h"

@implementation MStyle

@synthesize next = _next;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super init];
    if (self) {
        _next = [next retain];
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [self initWithNext:nil];
    if (self) {
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_next);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)next:(MStyle*)next {
    self.next = next;
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
    if (self.next) {
        return [self.next addToInsets:insets forSize:size];
        
    } else {
        return insets;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    if (_next) {
        return [self.next addToSize:size context:context];
        
    } else {
        return size;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addStyle:(MStyle*)style {
    if (_next) {
        [_next addStyle:style];
        
    } else {
        _next = [style retain];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)firstStyleOfClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else {
        return [self.next firstStyleOfClass:cls];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)styleForPart:(NSString*)name {
    MStyle* style = self;
    while (style) {
        if ([style isKindOfClass:[MPartStyle class]]) {
            MPartStyle* partStyle = (MPartStyle*)style;
            if ([partStyle.name isEqualToString:name]) {
                return partStyle;
            }
        }
        style = style.next;
    }
    return nil;
}


@end
