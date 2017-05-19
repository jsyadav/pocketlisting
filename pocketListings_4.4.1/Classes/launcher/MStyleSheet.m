//
//  MStyleSheet.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyleSheet.h"
#import "MDefaultStyleSheet.h"
#import "MCorePreprocessorMacros.h"

static MStyleSheet* gStyleSheet = nil;

@implementation MStyleSheet

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]
         addObserver: self
         selector: @selector(didReceiveMemoryWarning:)
         name: UIApplicationDidReceiveMemoryWarningNotification
         object: nil];
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver: self
     name: UIApplicationDidReceiveMemoryWarningNotification
     object: nil];
    TT_RELEASE_SAFELY(_styles);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MStyleSheet*)globalStyleSheet {
    if (!gStyleSheet) {
        gStyleSheet = [[MDefaultStyleSheet alloc] init];
    }
    return gStyleSheet;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setGlobalStyleSheet:(MStyleSheet*)styleSheet {
    [gStyleSheet release];
    gStyleSheet = [styleSheet retain];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSNotifications


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning:(void*)object {
    [self freeMemory];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)styleWithSelector:(NSString*)selector {
    return [self styleWithSelector:selector forState:UIControlStateNormal];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (MStyle*)styleWithSelector:(NSString*)selector forState:(UIControlState)state {
    NSString* key = state == UIControlStateNormal
    ? selector
    : [NSString stringWithFormat:@"%@%d", selector, state];
    MStyle* style = [_styles objectForKey:key];
    if (!style) {
        SEL sel = NSSelectorFromString(selector);
        if ([self respondsToSelector:sel]) {
            style = [self performSelector:sel withObject:(id)state];
            if (style) {
                if (!_styles) {
                    _styles = [[NSMutableDictionary alloc] init];
                }
                [_styles setObject:style forKey:key];
            }
        }
    }
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)freeMemory {
    TT_RELEASE_SAFELY(_styles);
}


@end
